module IdentityApp
  class Identity < ApplicationRecord
    validates :email, presence: true, uniqueness: true
  end
end
