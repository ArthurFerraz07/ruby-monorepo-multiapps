class WithdrawsController < ApplicationController
  include SantaCruzAuth::AuthenticateConcern

  before_action :authenticate!, only: %i[start index]

  def index
    withdraws = Withdraw.where(identity_email: @identity_email)
    render(json: withdraws)
  end

  # POST /withdraws
  def start
    service_response = WithdrawService.new(withdraw_params.merge(identity_email: @identity_email)).call
    if service_response.success
      render(json: service_response.data)
    else
      render(json: { error: service_response.error_message }, status: 401)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def withdraw_params
    params.permit(:currency, :amount, :address)
  end
end
