Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about", as: 'about'
  get "search" => "searches#search"
  get 'tagsearches/search' => 'tagsearches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
    get "search" => "users#search"
  end
   resources :chats, only: [:show, :create]

  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
