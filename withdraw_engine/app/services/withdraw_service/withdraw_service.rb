module WithdrawEngine
  class WithdrawService < ApplicationService
    def initialize(params)
      super()
      @identity_id  = params[:identity_id]
      @currency     = params[:currency]
      @amount       = params[:amount]
      @address      = params[:address]
    end

    def call
      build_withdraw

      @withdraw.transaction do
        @withdraw.update!(status: 'processing')

        lazy_process

        @withdraw.update!(status: 'done')
      end

      ServiceResponse.new(data: { withdraw: @withdraw })
    end

    private

    def build_withdraw
      @withdraw = Withdraw.create!(
        identity_id: @identity_id,
        currency: @currency,
        amount: @amount,
        address: @address,
        status: 'pending'
      )
    end

    def lazy_process
      Async do |task|
        ap 'sleep 1'
        task.async do
          sleep 1
        end
        ap 'sleep 2'
        task.async do
          sleep 1
        end
        ap 'sleep 3'
        task.async do
          sleep 1
        end
        ap 'sleep 4'
        task.async do
          sleep 1
        end
        ap 'sleep 5'
        task.async do
          sleep 1
        end
        ap 'sleep 6'
      end
    end
  end
end
