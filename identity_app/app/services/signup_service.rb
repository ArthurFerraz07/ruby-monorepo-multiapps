class SignupService < ApplicationService
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

    identity.transaction do
      identity.save!

      @response = ServiceResponse.new(
        success: true,
        data: { identity: }
      )
    end
  rescue ActiveRecord::RecordInvalid => e
    ServiceResponse.new(success: false, error: e)
  rescue StandardError => e
    binding.pry
    ServiceResponse.new(success: false, error: ServiceError.new('error', genesis_error: e))
  end

  private

  def encrypt_password
    BCrypt::Password.create(@password)
  end
end
