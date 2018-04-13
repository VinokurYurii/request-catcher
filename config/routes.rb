Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get '/:path/requests', to: 'catcher#show', constraints: { path: /\w+/ }, as: 'show_request_data'
  match '/:path/*scheme', to: 'catcher#catch_request', via: :all, constraints: { path: /\w+/ }, as: 'catch_empty_request'
  match '/:path', to: 'catcher#catch_request', via: :all,
        constraints: { path: /\w+/ }, defaults: { scheme: nil }, as: 'catch_request'
  get '/', to: 'application#index', as: 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
