module IdentityApp
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    if ENV['APP_NAME'] == 'identity_app'
      connects_to database: { writing: :identity_app, reading: :identity_app }
    else
      connects_to database: { reading: :identity_app }
    end
  end
end
