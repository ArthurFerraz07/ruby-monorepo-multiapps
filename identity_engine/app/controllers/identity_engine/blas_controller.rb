module IdentityEngine
  class BlasController < ApplicationController
    def home
      render json: { success: true }
    end
  end
end
