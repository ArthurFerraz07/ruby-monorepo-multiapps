WithdrawEngine::Engine.routes.draw do
  get '/', to: 'withdraws#index'
  post '/', to: 'withdraws#start'
end
