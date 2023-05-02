module IdentityApp
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
        service_response = SigninService.new(email: request.headers['EMAIL'],
                                            password: request.headers['PASSWORD']).call

        if service_response.success
          @identity = service_response.data[:identity]
        else
          binding.pry
          raise AuthenticationError, service_response.error_message
        end
      end
    end
  end
end
