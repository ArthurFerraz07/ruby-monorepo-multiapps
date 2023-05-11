require 'santa_cruz_auth/authenticate'
require 'santa_cruz_auth/generate_token'
require 'santa_cruz_auth/authentication_concern'

module SantaCruzAuth
  JWT_ALGORITHM = 'HS256'.freeze
  JWT_HMAC_SECRET = ENV['HMAC_SECRET']
end
