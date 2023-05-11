require 'bcrypt'

class SignupService < SantaCruz::ApplicationService
  def initialize(params)
    super()
    @email = params[:email]
    @password = params[:password]
  end

  def call
    validate_email
    encrypt_password

    identity = Identity.new(
      email: @email,
      encrypted_password: @encrypted_password
    )

    identity.save!
    build_response(data: { identity: })
  rescue ActiveRecord::RecordInvalid => e
    build_response(success: false, error: SantaCruz::ServiceError.new(e.message, genesis_error: e))
  end

  private

  def encrypt_password
    @encrypted_password = BCrypt::Password.create(@password)
  end

  def validate_email
    true
  end
end
