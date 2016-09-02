Rails.application.routes.draw do
  resources :invoices
  devise_for :admins
    root 'home#home'
    resources :clients
    resources :services
    get 'home' => 'home#home'
end
