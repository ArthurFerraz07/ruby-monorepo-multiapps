require 'bcrypt'

module IdentityEngine
  class SigninService < ApplicationService
    def initialize(params)
      super()
      @email = params[:email]
      @password = params[:password]
    end

    def call
      load_identity
      verify_password

      ServiceResponse.new(data: { identity: @identity })
    rescue ServiceError => e
      ServiceResponse.new(success: false, error: e)
    rescue ActiveRecord::RecordNotFound => e
      ServiceResponse.new(success: false, error: ServiceError.new('invalid email', genesis_error: e))
    rescue StandardError => e
      ServiceResponse.new(success: false, error: ServiceError.new('error', genesis_error: e))
    end

    private

    def load_identity
      @identity = Identity.find_by_email!(@email)
    end

    def verify_password
      raise ServiceError, 'invalid password' unless BCrypt::Password.new(@identity.encrypted_password) == @password
    end
  end
end
