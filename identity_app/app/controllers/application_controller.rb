class ApplicationController < ActionController::API
  def load_identity(email)
    @identity = Identity.find_by_email(email)
  end
end
