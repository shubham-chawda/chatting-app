Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users
  resources :messages
  resources :rooms

  root 'rooms#index'

end
