require 'santa_cruz/service_response'
require 'santa_cruz/service_error'
require 'santa_cruz_auth/identity_info'
require 'httparty'

module SantaCruzAuth
  class GetIdentityInfo
    def initialize(params)
      @email = params[:email]
      @app_name = params[:app_name]
      @load_identity_url = params[:load_identity_url]
      @token = params[:token]
    end

    def call
      verify_email
      load_identity_info
      SantaCruz::ServiceResponse.new(identity_info: @identity_info)
    end

    private

    def load_identity_info
      if @app_name == 'identity_app'
        load_identity_from_db
      else
        load_identity_from_remote_app
      end
    end

    def load_identity_from_db
      identity = ::Identity.find_by_email(@email)
      @identity_info = IdentityInfo.from_identity(identity)
    end

    def load_identity_from_remote_app
      response = HTTParty.get(@load_identity_url, headers: { 'Authorization' => @token })

      if response.success?
        @identity_info = SantaCruzAuth::IdentityInfo.new(
          id: response['id'],
          email: response['email'],
          encrypted_password: response['encrypted_password']
        )
      else
        raise SantaCruz::ServiceError, response.message
      end
    end

    def verify_email
      raise SantaCruz::ServiceError, 'Email cannot be blank' if email.blank?
    end
  end
end
