require 'santa_cruz_auth/identity_info'
require 'santa_cruz_auth/generate_token'
require 'santa_cruz_auth/authenticate'
require 'santa_cruz_auth/authenticate_concern'

module SantaCruzAuth
  JWT_DEFAULT_ALGORITHM = 'HS256'.freeze
  JWT_DEFAULT_EXPIRATION = 3600
end
