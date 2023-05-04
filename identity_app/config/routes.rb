Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  if ENV['APP_NAME'] == IdentityApp::APP_NAME
    scope '/identity', module: IdentityApp::APP_NAME do
      post 'signin', to: 'identities#signin'
      post 'signup', to: 'identities#signup'
    end
  end
end
