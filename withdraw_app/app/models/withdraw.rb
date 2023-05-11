class Withdraw < ApplicationRecord
  enum status: {
    pending: 'pending',
    processing: 'processing',
    done: 'done'
  }
end
