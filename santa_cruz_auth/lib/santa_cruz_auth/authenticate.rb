require 'santa_cruz/service_response'
require 'santa_cruz/service_error'
require 'jwt'

module SantaCruzAuth
  class Authenticate
    def initialize(params)
      @token = params[:token]
      @secret = params[:secret]
      @algorithm = params[:algorithm]
    end

    def call
      define_timestamp
      decode_token
      load_email

      raise SantaCruz::ServiceError, 'expired token' if @token_payload['exp'] < @timestamp

      SantaCruz::ServiceResponse.new(success: true, data: { email: @email })
    rescue SantaCruz::ServiceError => e
      SantaCruz::ServiceResponse.new(success: false, error: e)
    end

    private

    def decode_token
      raise SantaCruz::ServiceError, 'missing token' if @token.blank?
      raise SantaCruz::ServiceError, 'missing secret' if @secret.blank?
      raise SantaCruz::ServiceError, 'missing algorithm' if @algorithm.blank?

      decoded_token = JWT.decode @token, @secret, true, { algorithm: @algorithm }

      @token_payload = decoded_token.first
      @token_header = decoded_token.last
    rescue JWT::DecodeError => e
      raise SantaCruz::ServiceError.new('invalid token', genesis_error: e)
    end

    def define_timestamp
      @timestamp = Time.now.to_i
    end

    def load_email
      @email = @token_payload['email']

      raise SantaCruz::ServiceError, 'invalid email' if @email.blank?
    end
  end
end
