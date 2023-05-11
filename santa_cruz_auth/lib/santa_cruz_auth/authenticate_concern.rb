require 'active_support/concern'

module SantaCruzAuth
  module AuthenticateConcern
    extend ActiveSupport::Concern

    class AuthenticationError < StandardError; end

    included do
      rescue_from AuthenticationError do |exception|
        render(json: { error: exception.message }, status: 401)
      end

      def identity_info
        @identity_info
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
          load_identity_info(request.headers['Authorization'])
        else
          raise AuthenticationError, service_response.error_message
        end
      end

      def load_identity_info(token)
        service_response = SantaCruzAuth::GetIdentityInfo.new(
          email: identity_email,
          app_name: ENV.fetch('APP_NAME'),
          load_identity_url: ENV.fetch('SANTA_CRUZ_GET_IDENTITY_URL', nil),
          token:
        ).call
        if service_response.success
          @identity_info = service_response.data
        else
          raise AuthenticationError, service_response.error_message
        end
      rescue SantaCruz::ServiceError => e
        raise AuthenticationError, e.message
      end
    end
  end
end
