Rails.application.routes.draw do

  root 'tops#top'
  get 'tops/top'
  get 'tops/about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :leave, :update, :destroy] do
    get 'leave', to: 'users#leave', on: :member
  end
  get 'user/search', to: 'users#search', as: 'users_search'
  resources :contents
  get 'content/search', to: 'contents#search', as: 'contents_search'
  resources :reviews, only: [:create, :destroy, :edit, :update]
  post 'favorites/:content_id', to:'favorites#create', as: 'create_favorites'
  delete  'favorites/:content_id', to:'favorites#destroy', as:'destroy_favorites'
  resources :chat_rooms, only: [:index, :create, :show]
  post 'chat_room/:user_id', to: 'chat_rooms#create', as: 'create_chat_room'
  resources :hearts, only: [:create]

  # For details on the DSL available within this filtoe, see http://guides.rubyonrails.org/routing.html
end
