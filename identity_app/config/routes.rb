Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '/identity' do
    get '/', to: 'identities#show'
    get 'authenticate', to: 'identities#authenticate'
    post 'signin', to: 'identities#signin'
    post 'signup', to: 'identities#signup'
  end
end
