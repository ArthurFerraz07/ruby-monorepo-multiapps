Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'withdraw' do
    get '/', to: 'withdraws#index'
    post '/', to: 'withdraws#start'
  end
end
