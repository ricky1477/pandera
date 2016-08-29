Rails.application.routes.draw do
    root 'home#home'
    resources :clients
    resources :services
    get 'home' => 'home#home'
end
