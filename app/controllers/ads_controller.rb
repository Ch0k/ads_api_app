class AdsController < ApplicationController
  include PaginationLinks

  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  skip_before_action :auth_user, only: :index

  def index
    ads = Ad.order(updated_at: :desc).page(params[:page])

    serializer = AdSerializer.new(ads, links: pagination_links(ads))
    render json: serializer.serialized_json, status: :ok
  end

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

  def ad_params
    params.require(:ad).permit(:title, :description, :city)
  end
end
