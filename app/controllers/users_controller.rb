class UsersController < ApplicationController
  skip_before_action :auth_user, only: :create

  def create
    result = Users::CreateService.new(*user_params).call

    if result.success?
      head :created
    else
      error_response(result.user, :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(%i[name email password])
  end
end
