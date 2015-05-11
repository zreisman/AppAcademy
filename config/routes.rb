Rails.application.routes.draw do
  resources :users only: [:index, :create, :show, :update, :destroy]
  # get 'users' => 'users#index', :as => 'users'
  # post 'users' => 'users#create', :as => 'create_user'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # get 'users/:id' => 'users#show', :as => 'user'
  # patch 'users/:id' => 'users#update', :as => 'patch_user'
  # put 'users/:id' => 'users#update', :as => 'put_user'
  # delete 'users/:id' => 'users#destroy', :as => 'delete_user'
end
