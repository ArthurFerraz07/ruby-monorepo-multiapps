class ApplicationController < ActionController::API
  def load_identity(email)
    @identity_email = email
  end
end
