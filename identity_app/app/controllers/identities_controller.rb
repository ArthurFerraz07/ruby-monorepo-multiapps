require 'santa_cruz_auth'

class IdentitiesController < ApplicationController
  include SantaCruzAuth::AuthenticationConcern

  before_action :authenticate!, only: %i[show authenticate]

  def show
    render(json: identity)
  end

  def authenticate
    render(json: { message: 'authenticated' })
  end

  def signin
    service_response = SigninService.new(signin_params).call
    if service_response.success
      render(json: service_response.data)
    else
      render(json: { error: service_response.error_message }, status: 401)
    end
  end

  def signup
    service_response = SignupService.new(signup_params).call
    if service_response.success
      render(json: service_response.data)
    else
      render(json: { error: service_response.error_message }, status: 400)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def signin_params
    params.permit(:email, :password)
  end

  # Only allow a list of trusted parameters through.
  def signup_params
    params.permit(:email, :password)
  end
end
