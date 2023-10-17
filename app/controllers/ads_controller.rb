class AdsController < ApplicationController
  
  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  before_action :auth_user
  attr_reader :current_user

  def create
    result = Ads::CreateService.new(
      ad: ad_params,
      user: current_user
    ).call

    if result.success?
      serializer = AdSerializer.new(result.ad)
      render json: serializer.serialized_json, status: :created
    else
      error_response(result.ad, :unprocessable_entity)
    end
  end

  private

  def auth_user
    result = Auth::FetchUserService.new(extracted_token['uuid']).call

    if result.success?
      @current_user = result.user
    else
      error_response(result, :forbidden)
    end
  end

  def extracted_token
    JwtEncoder.decode(matched_token)
  rescue JWT::DecodeError
    {}
  end

  def matched_token
    result = auth_header&.match(AUTH_TOKEN)
    return if result.blank?

    result[:token]
  end

  def auth_header
    request.headers['Authorization']
  end

  def ad_params
    params.require(:ad).permit(:title, :description, :city)
  end
end
