Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {registrations: "registrations"} do
  #   resources :profiles
  # end
  root to: 'pages#home'
  resources :gigs
  resources :profiles
end
