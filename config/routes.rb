Rails.application.routes.draw do
  match '/:path/*scheme', to: 'catcher#index', via: :all, constraints: { path: /\w+/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
