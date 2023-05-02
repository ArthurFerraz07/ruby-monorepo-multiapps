module IdentityEngine
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to database: { writing: :identity, reading: :identity }
  end
end
