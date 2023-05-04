# require all files on service folder

Bundler.require(:default)

require 'santa_cruz/application_service'
require 'santa_cruz/service_response'
require 'santa_cruz/service_error'

module SantaCruz; end
