require 'santa_cruz'
require 'active_support/concern'

module SantaCruzAuth
  module AuthenticationConcern
    extend ActiveSupport::Concern

    class AuthenticationError < StandardError; end

    included do
      rescue_from AuthenticationError do |exception|
        render(json: { error: exception.message }, status: 401)
      end

      def identity
        @identity
      end

      def authenticate!
        service_response = AuthenticateService.new(token: request.headers['Authorization']).call

        if service_response.success
          @identity = load_identity(service_response.data[:identity_email])
        else
          raise AuthenticationError, service_response.error_message
        end
      end
    end
  end
end
