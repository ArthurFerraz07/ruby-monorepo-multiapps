require 'santa_cruz'
require 'jwt'
require 'pry'

binding.pry
module SantaCruzAuth
  class Authenticate < SantaCruz::ApplicationService
    # def initialize(params)
    #   super()
    #   @token = params[:token]
    # end

    # def call
    #   define_timestamp
    #   decode_token
    #   load_identity_email

    #   raise SantaCruz::ServiceError, 'expired token' if @token_payload['exp'] < @timestamp

    #   build_response(data: { identity_email: @identity_email })
    # rescue SantaCruz::ServiceError => e
    #   build_response(success: false, error: e)
    # end

    # private

    # def decode_token
    #   raise SantaCruz::ServiceError, 'missing token' if @token.blank?

    #   decoded_token = JWT.decode @token, JWT_HMAC_SECRET, true, { algorithm: JWT_ALGORITHM }

    #   @token_payload = decoded_token.first
    #   @token_header = decoded_token.last
    # rescue JWT::DecodeError => e
    #   raise SantaCruz::ServiceError.new('invalid token', genesis_error: e)
    # end

    # def define_timestamp
    #   @timestamp = Time.now.to_i
    # end

    # def load_identity_email
    #   @identity_email = @token_payload['identity_email']

    #   raise SantaCruz::ServiceError, 'invalid email' if @identity_email.blank?
    # end
  end
end
