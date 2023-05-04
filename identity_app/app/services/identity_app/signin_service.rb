require 'bcrypt'

module IdentityApp
  class SigninService < SantaCruz::ApplicationService
    def initialize(params)
      super()
      @email = params[:email]
      @password = params[:password]
    end

    def call
      load_identity
      verify_password

      build_response(data: { identity: @identity })
    rescue SantaCruz::ServiceError => e
      build_response(success: false, error: e)
    rescue ActiveRecord::RecordNotFound => e
      build_response(success: false, error: SantaCruz::ServiceError.new('invalid email', genesis_error: e))
    rescue StandardError => e
      build_response(success: false, error: SantaCruz::ServiceError.new('error', genesis_error: e))
    end

    private

    def load_identity
      @identity = Identity.find_by_email!(@email)
    end

    def verify_password
      raise SantaCruz::ServiceError, 'invalid password' unless BCrypt::Password.new(@identity.encrypted_password) == @password
    end
  end
end
