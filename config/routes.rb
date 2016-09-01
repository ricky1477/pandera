Rails.application.routes.draw do
  devise_for :admins
    root 'home#home'
    resources :clients
    resources :services
    get 'home' => 'home#home'
end
