Rails.application.routes.draw do
  resources :shipping_addresses
    devise_for :admins
    root 'home#home'
    resources :invoices
    get 'invoices_show_all' => 'invoices#show_all', as: 'show_all'
    resources :clients
    resources :services
    get 'home' => 'home#home'
end
