class ApplicationController < ActionController::API
  include Auth
  include ApiErrors
end
