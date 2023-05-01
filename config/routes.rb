Rails.application.routes.draw do
  scope '/identity' do
    post 'signin', to: 'identities#signin'
    post 'signup', to: 'identities#signup'
  end
end
