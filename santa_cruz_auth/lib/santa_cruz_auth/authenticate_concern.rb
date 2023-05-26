require 'active_support/concern'

module SantaCruzAuth
  module AuthenticateConcern
    extend ActiveSupport::Concern

    class AuthenticationError < StandardError; end

    included do
      rescue_from AuthenticationError do |exception|
        render(json: { error: exception.message }, status: 401)
      end

      def identity_email
        @identity_email
      end

      private

      def authenticate!
        service_response = SantaCruzAuth::Authenticate.new(
          token: request.headers['Authorization'],
          algorithm: ENV.fetch('SANTA_CRUZ_AUTH_ALGORITHM', JWT_DEFAULT_ALGORITHM),
          secret: ENV.fetch('SANTA_CRUZ_AUTH_SECRET')
        ).call

        if service_response.success
          @identity_email = service_response.data[:email]
        else
          raise AuthenticationError, service_response.error_message
        end
      end
    end
  end
end
