Rails.application.routes.draw do
  resources :service_types
  resources :schedules
  resources :expenses
  resources :estimates
  resources :charges
  resources :shipping_addresses
    devise_for :admins
    root 'home#home'
    resources :invoices
    get 'invoices_show_all' => 'invoices#show_all', as: 'show_all'
    get 'create_monthly_invoices' => 'clients#create_monthly_invoices'
    get 'last_service_price' => 'clients#last_service_price'
    get 'last_service_prices_by_name_address' => 'clients#last_service_prices_by_name_address'
    resources :clients
    resources :services
    post 'invoices/payment_reminder'
    get 'invoice_letter/:id' => 'invoices#letter', as: 'invoice_letter'
    post 'create_services' => 'clients#create_services'
    get 'home' => 'home#home'
    get 'prospects' => 'clients#prospects'
    get 'dashboard' => 'expenses#index'
    get 'schedule', :to => redirect('schedule.erb.html')
    get 'googlea87d8b3af5e98ec8.html', :to => redirect('googlea87d8b3af5e98ec8.html')
    get 'favicon.ico', :to => redirect('https://pandera.ml/images/pandera_app/favicon-32x32.png')
    get 'apple-touch-icon.png', :to => redirect('https://pandera.ml/images/pandera_app/apple-touch-icon.png')
    get 'apple-touch-icon-76x76.png', :to => redirect('https://pandera.ml/images/pandera_app/apple-touch-icon-76x76.png')
    get 'apple-touch-icon-120x120-precomposed.png', :to => redirect('https://pandera.ml/images/pandera_app/apple-touch-icon-120x120-precomposed.png')
end
