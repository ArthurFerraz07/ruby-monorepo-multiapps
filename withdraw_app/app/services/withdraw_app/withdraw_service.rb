module WithdrawApp
  class WithdrawService < SantaCruz::ApplicationService
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

      build_response(data: { withdraw: @withdraw })
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

    # async process
    def lazy_process
      Async do |task|
        task.async do
          sleep 1
        end
        task.async do
          sleep 1
        end
        task.async do
          sleep 1
        end
        task.async do
          sleep 1
        end
        task.async do
          sleep 1
        end
      end
    end
  end
end
