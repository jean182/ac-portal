Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    root 'dashboard#show'
  end

  namespace :mentor do
    root 'dashboard#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
