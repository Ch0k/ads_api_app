class SessionsController < ApplicationController
  def create
    result = Sessions::CreateService.new(*session_params).call
    byebug
    if result.success?
      # token = JwtEncoder.encode(uuid: result.session.uuid)
      token = result.session.uuid

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