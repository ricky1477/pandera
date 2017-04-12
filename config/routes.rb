Rails.application.routes.draw do
  resources :expenses
  resources :estimates
  resources :charges
  resources :shipping_addresses
    devise_for :admins
    root 'home#home'
    resources :invoices
    get 'invoices_show_all' => 'invoices#show_all', as: 'show_all'
    get 'create_monthly_invoices' => 'clients#create_monthly_invoices'
    resources :clients
    resources :services
    post 'invoices/payment_reminder'
    get 'home' => 'home#home'
    get 'dashboard' => 'expenses#index'
    get 'googlea87d8b3af5e98ec8.html', :to => redirect('googlea87d8b3af5e98ec8.html')
    get 'favicon.ico', :to => redirect('https://www.dropbox.com/s/92xvznr5p84zswn/favicon-32x32.png?dl=0&raw=1')
    get 'apple-touch-icon.png', :to => redirect('https://www.dropbox.com/s/zf61qb2eh45pzkm/apple-touch-icon.png?dl=0&raw=1')
    get 'apple-touch-icon-76x76.png', :to => redirect('https://www.dropbox.com/s/zf61qb2eh45pzkm/apple-touch-icon.png?dl=0&raw=1')
    get 'apple-touch-icon-120x120-precomposed.png', :to => redirect('https://www.dropbox.com/s/zf61qb2eh45pzkm/apple-touch-icon.png?dl=0&raw=1')
end
