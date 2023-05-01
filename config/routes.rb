Rails.application.routes.draw do
  scope '/identity' do
    post 'signin', to: 'identities#signin'
    post 'signup', to: 'identities#signup'
  end

  scope '/prices' do
    get '/', to: 'prices#index'
  end
end
