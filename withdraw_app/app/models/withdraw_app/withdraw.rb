module WithdrawApp
  class Withdraw < ApplicationRecord
    enum status: {
      pending: 'pending',
      processing: 'processing',
      done: 'done'
    }

    def identity
      @identity || IdentityApp::Identity.find(identity_id)
    end

    def identity=(value)
      @identity = IdentityApp::Identity.find(value)
    end
  end
end
