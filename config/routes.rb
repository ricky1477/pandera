Rails.application.routes.draw do
  resources :estimates
  resources :charges
  resources :shipping_addresses
    devise_for :admins
    root 'home#home'
    resources :invoices
    get 'invoices_show_all' => 'invoices#show_all', as: 'show_all'
    resources :clients
    resources :services
    get 'home' => 'home#home'
    get 'googlea87d8b3af5e98ec8.html', :to => redirect('googlea87d8b3af5e98ec8.html')
end
