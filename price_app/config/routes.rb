Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  if ENV['APP_NAME'] == PriceApp::APP_NAME
    scope '/price', module: PriceApp::APP_NAME do
      get '/', to: 'prices#index'
    end
  end
end
