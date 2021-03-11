Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gigs
  resources :profiles
  post '/gigs/:id/request', to: "requests#new", as: "new_request"
  get '/my_requests', to: "requests#show", as: "user_requests"
  resources :donations
  post 'payments/webhook', to: 'payments#webhook'
  get 'payments/success', to: 'pages#payment_success'
end
