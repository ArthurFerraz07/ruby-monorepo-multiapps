IdentityEngine::Engine.routes.draw do
  post 'signin', to: 'identities#signin'
  post 'signup', to: 'identities#signup'
end
