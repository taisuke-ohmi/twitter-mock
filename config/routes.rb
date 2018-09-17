Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'static_pages#home'
  get 'static_pages/home'

  resources :users, only: [:show]
  resources :posts, only: [:create, :destroy]
end
