module WithdrawEngine
  class Withdraw < ApplicationRecord
    belongs_to :identity

    enum status: {
      pending: 'pending',
      processing: 'processing',
      done: 'done'
    }
  end
end
