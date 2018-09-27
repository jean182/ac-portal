Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    root 'dashboard#show'
    resources :users, only: [:index, :show, :destroy]
    resources :mentors
    resources :admins
    resources :clients
    resources :tags
    resources :companies
  end

  namespace :mentor do
    root 'dashboard#show'
    resources :companies, only: [:index, :show]
    resources :phases 
    resources :milestones
  end
end
