module IdentityApp
  class IdentitiesController < ApplicationController
    before_action :set_identity, only: %i[ show update destroy ]

    # POST /signin
    def signin
      service_response = SigninService.new(signin_params).call
      if service_response.success
        render(json: service_response.data)
      else
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
