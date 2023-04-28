Rails.application.routes.draw do
  mount IdentityEngine::Engine => "/identity_engine"
end
