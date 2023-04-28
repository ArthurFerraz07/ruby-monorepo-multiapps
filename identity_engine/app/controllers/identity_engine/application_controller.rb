module IdentityEngine
  class ApplicationController < ActionController::API
    def home
      render json: { success: true }
    end
  end
end
