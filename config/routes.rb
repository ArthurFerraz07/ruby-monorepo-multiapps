Rails.application.routes.draw do
  scope '/identity' do
    post 'signin', to: 'identities#signin'
    post 'signup', to: 'identities#signup'
  end

  scope '/price' do
    get '/', to: 'prices#index'
  end

  scope 'withdraw' do
    get '/', to: 'withdraws#index'
    post '/', to: 'withdraws#start'
  end
end
