class SigninService < SantaCruz::ApplicationService
  JWT_ALGORITHM = 'HS256'.freeze
  JWT_HMAC_SECRET = ENV['HMAC_SECRET']
  TOKEN_EXPIRATION = 4 * 3600 # 4 hours

  def initialize(params)
    super()
    @email = params[:email]
    @password = params[:password]
  end

  def call
    load_identity
    verify_password
    generate_token

    build_response(data: { token: @token })
  rescue SantaCruz::ServiceError => e
    build_response(success: false, error: e)
  end

  private

  def load_identity
    @identity = Identity.find_by_email!(@email)
  rescue ActiveRecord::RecordNotFound => e
    raise SantaCruz::ServiceError.new('invalid email', genesis_error: e)
  end

  def generate_token
    santa_cruz_auth_response = SantaCruzAuth::GenerateToken.new(@identity.email).call

    if santa_cruz_auth_response.success
      @token = santa_cruz_auth_response.data
    else
      raise SantaCruz::ServiceError.new('invalid token', genesis_error: santa_cruz_auth_response.error)
    end
  end

  def verify_password
    return if BCrypt::Password.new(@identity.encrypted_password) == @password

    raise SantaCruz::ServiceError, 'invalid password'
  end
end
