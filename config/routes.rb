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
    get 'favicon.ico', :to => redirect('https://www.dropbox.com/s/92xvznr5p84zswn/favicon-32x32.png?dl=0&raw=1')
    #get 'apple-touch-icon.png', :to => redirect('https://www.dropbox.com/s/92xvznr5p84zswn/favicon-32x32.png?dl=0&raw=1')
    get 'apple-touch-icon-120x120-precomposed.png', :to => redirect('https://www.dropbox.com/s/8hzrto5aroel0z7/mstile-150x150.png?dl=0&raw=1')
end
