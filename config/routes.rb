Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users,
             path:       '',
             controllers: { invitations: 'users/invitations' },
             path_names: {
               sign_in:      'login',
               sign_out:     'logout',
               password:     'secret',
               confirmation: 'verification',
               unlock:       'unblock',
             }

  namespace :admin do
    root 'dashboard#show'
    resources :users, only: [:index, :show, :destroy]
    post 'users/:id/reactivate_user' => 'users#reactivate_user', as: :reactivate_user
    post 'users/:id/send_reset_password_instructions' => 'users#send_reset_password_instructions', as: :send_reset_password_instructions
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
    resources :companies do
      resources :company_phases, except: [:new, :create, :destroy], path: 'phase'
    end
    resources :checklists
    resources :company_tasks, except: [:index, :create, :new, :show, :edit, :update, :destroy] do
      put :approve
      put :refuse
    end
    resources :milestones, except: [:index, :create, :new, :show, :edit, :update, :destroy] do
      put :approve
      put :refuse
    end
    resources :logs, only: :index
  end

  namespace :mentor do
    root 'dashboard#show'
    resources :companies, only: [:index, :show] do
      resources :company_phases, except: [:new, :create, :destroy], path: 'phase'
    end
    resources :phases
    resources :milestones
  end

  namespace :member do
    root 'dashboard#show'
    resources :messages
    resources :companies, path: 'company', only: :show
    resources :clients
    resources :company_phases
    resources :milestones, except: [:index, :create, :new, :show, :edit, :update, :destroy] do
      put :mark_complete
      put :mark_incomplete
    end
    resources :tasks, except: [:index, :create, :new, :show, :edit, :update, :destroy] do
      put :mark_complete
      put :mark_incomplete
    end
  end
end
