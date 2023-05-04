require 'bcrypt'

module IdentityApp
  class SignupService < SantaCruz::ApplicationService
    def initialize(params)
      super()
      @email = params[:email]
      @password = params[:password]
    end

    def call
      identity = Identity.new(
        email: @email,
        encrypted_password: encrypt_password
      )

      identity.save!
      build_response(data: { identity: })
    rescue ActiveRecord::RecordInvalid => e
      build_response(success: false, error: SantaCruz::ServiceError.new(e.message, genesis_error: e))
    rescue StandardError => e
      build_response(success: false, error: SantaCruz::ServiceError.new('error', genesis_error: e))
    end

    private

    def encrypt_password
      BCrypt::Password.create(@password)
    end
  end
end
