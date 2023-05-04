Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  if ENV['APP_NAME'] == WithdrawApp::APP_NAME
    scope 'withdraw', module: WithdrawApp::APP_NAME do
      get '/', to: 'withdraws#index'
      post '/', to: 'withdraws#start'
    end
  end
end
