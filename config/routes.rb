Rails.application.routes.draw do
  root 'home#index'
  mount Notifications::Engine => "/notifications"
  devise_for :users
  resources :messages
  resources :rooms

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :user_messages, only: [:create]
  end
  # root 'rooms#index'

end
