module WithdrawEngine
  class Withdraw < ApplicationRecord
    self.table_name = 'withdraws'

    belongs_to :identity, class_name: 'IdentityEngine::Identity'

    enum status: {
      pending: 'pending',
      processing: 'processing',
      done: 'done'
    }
  end
end
