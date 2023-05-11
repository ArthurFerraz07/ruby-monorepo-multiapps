require 'santa_cruz'

module SantaCruzAuth
  class GenerateToken
    def initialize(params)
      @email = params[:email]
      @secret = params[:secret]
      @algorithm = params[:algorithm]
      @expiration = params[:expiration]
    end

    def call
      build_payload
      generate_token

      SantaCruz::ServiceResponse.new(success: true, data: { token: @token })
    end

    private

    def build_payload
      raise SantaCruz::ServiceError, 'missing identity email' if @email.blank?
      raise SantaCruz::ServiceError, 'missing expiration' if @expiration.blank?

      timestamp = Time.now.to_i
      @payload = {
        email: @email,
        exp: timestamp + @expiration.to_i,
        timestamp:
      }
    end

    def generate_token
      raise SantaCruz::ServiceError, 'missing secret' if @secret.blank?
      raise SantaCruz::ServiceError, 'missing algorithm' if @algorithm.blank?

      @token = JWT.encode @payload, @secret, @algorithm
    end
  end
end
