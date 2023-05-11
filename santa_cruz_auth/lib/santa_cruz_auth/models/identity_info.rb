module SantaCruzAuth
  class IdentityInfo
    attr_accessor :id, :email, :encrypted_password

    def initialize(params)
      @id = params[:id]
      @email = params[:email]
      @encrypted_password = params[:encrypted_password]
    end

    class << self
      def from_identity(identity)
        new(
          id: identity.id,
          email: identity.email,
          encrypted_password: identity.encrypted_password
        )
      end
    end
  end
end
