Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    root 'dashboard#show'
    resources :users, only: [:index, :show, :destroy]
    post 'users/:id/reactivate_user' => 'users#reactivate_user', as: :reactivate_user
    get 'reactivate_user'
    resources :mentors
    post 'mentors/:id/reactivate_mentor' => 'mentors#reactivate_mentor', as: :reactivate_mentor
    get 'reactivate_mentor'
    resources :admins
    post 'admins/:id/reactivate_admin' => 'admins#reactivate_admin', as: :reactivate_admin
    get 'reactivate_admin'
    resources :clients
    post 'clients/:id/reactivate_client' => 'clients#reactivate_client', as: :reactivate_client
    get 'reactivate_client'
    resources :tags
    resources :companies
  end

  namespace :mentor do
    root 'dashboard#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
