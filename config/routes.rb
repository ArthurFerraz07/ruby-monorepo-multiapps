Rails.application.routes.draw do
  mount IdentityEngine::Engine => "/identity"

  scope '/price' do
    get '/', to: 'prices#index'
  end

  scope 'withdraw' do
    get '/', to: 'withdraws#index'
    post '/', to: 'withdraws#start'
  end
end
