Rails.application.routes.draw do

  root 'tops#top'
  get 'tops/top'
  get 'tops/about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :leave, :update, :destroy] do
    get 'leave', to: 'users#leave', on: :member
  end
  get 'search', to: 'users#search'
  resources :contents
  get 'search', to: 'contents#search'
  resources :reviews, only: [:create, :destroy, :edit, :update]
  post 'favorites/:content_id', to:'favorites#create', as: 'create_favorites'
  delete  'favorites/:content_id', to:'favorites#destroy', as:'destroy_favorites'
  resources :chat_rooms, only: [:index, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
