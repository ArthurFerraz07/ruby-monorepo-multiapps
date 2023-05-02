module IdentityEngine
  class IdentitiesController < ApplicationController
    # POST /signin
    def signin
      ap 'hbdhgfv'
      service_response = IdentityEngine::SigninService.new(signin_params).call
      if service_response.success
        render(json: service_response.data)
      else
        ap service_response.error.genesis_error
        render(json: { error: service_response.error_message }, status: 401)
      end
    end

    # POST /signup
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
end
