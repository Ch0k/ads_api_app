class ApplicationController < ActionController::API
  def error_response(error_messages, status)
    errors = case error_messages
    when ActiveRecord::Base
      ErrorSerializer.from_model(error_messages)
    else
      ErrorSerializer.from_messages(error_messages)
    end

    render json: errors, status: status
  end
end
