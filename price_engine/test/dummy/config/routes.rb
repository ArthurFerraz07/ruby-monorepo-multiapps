Rails.application.routes.draw do
  mount PriceEngine::Engine => "/price_engine"
end
