# This file is used by Rack-based servers to start the application.
require 'bundler'

Bundler.require(:default)

run IdentityEngine::Engine
