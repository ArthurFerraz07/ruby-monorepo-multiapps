class WithdrawsController < ApplicationController
  include AuthenticationConcern
  before_action :authenticate!, only: %i[start]

  # POST /withdraws
  def start
    service_response = WithdrawService.new(withdraw_params.merge(identity_id: @identity.id)).call
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
