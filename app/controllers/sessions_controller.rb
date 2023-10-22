class SessionsController < ApplicationController
  skip_before_action :auth_user, only: :create
  
  def create
    result = Sessions::CreateService.new(*session_params).call
    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)

      meta = { token: token }

      render json: { meta: meta }, status: :created
    else
      error_response(result.session, :unprocessable_entity)
    end
  end

  private

  def session_params
    params.require(%i[email password])
  end
end
