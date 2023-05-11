module SantaCruzAuth
  class IdentityInfo
    attr_accessor :id, :email

    def initialize(params)
      @id = params[:id]
      @email = params[:email]
    end

    class << self
      def from_identity(identity)
        new(
          id: identity.id,
          email: identity.email
        )
      end
    end
  end
end
