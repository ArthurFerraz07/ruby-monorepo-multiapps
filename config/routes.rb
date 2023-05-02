Rails.application.routes.draw do
  mount IdentityEngine::Engine => "/identity"

  mount PriceEngine::Engine => "/price"

  mount WithdrawEngine::Engine => "/withdraw"
end
