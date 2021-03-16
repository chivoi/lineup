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
  post 'payments/stripe', to: "payments#create_stripe_session", as: "new_stripe_session"

  put "/my_requests/:id/accept", to: "requests#approve", as: "approve_request"
  put "/my_requests/:id/decline", to: "requests#decline", as: "decline_request"

  resources :conversations do
    resources :messages
   end
end
