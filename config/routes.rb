Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gigs
  resources :profiles
  post '/gigs/:id/request', to: "requests#new", as: "new_request"
end
