Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  if ENV['APP_NAME'] == 'price_app'
    scope '/price', module: 'price_app' do
      get '/', to: 'prices#index'
    end
  end
end
