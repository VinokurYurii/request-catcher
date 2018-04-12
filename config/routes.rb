Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get '/:path/requests', to: 'catcher#show', constraints: { path: /\w+/ }
  match '/:path/*scheme', to: 'catcher#catch_request', via: :all, constraints: { path: /\w+/ }
  match '/:path', to: 'catcher#catch_request', via: :all, constraints: { path: /\w+/ }, defaults: { scheme: nil }
  get '/', to: 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
