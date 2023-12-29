Rails.application.routes.draw do
  resources :posts
  devise_for :users
  devise_scope :user do
    get '/custom_sign_out', to: 'devise/sessions#destroy', as: :custom_destroy_user_session
  end
  resources :users, only: %i[index show]  
  post 'users/:id/block', to: 'users#block', as: 'block_user'
  root 'users#index'

end