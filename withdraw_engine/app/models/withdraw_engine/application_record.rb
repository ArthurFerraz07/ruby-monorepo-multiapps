module WithdrawEngine
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to database: { writing: :withdraw, reading: :withdraw }
  end
end
