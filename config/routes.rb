Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For users devise
  root to: "projects#index"
  resources :bugs
  resources :projects 
      # manager
  resources :users, only: [:show]
      # bugs
  resources :bugs, only: [:new, :create, :show]
     #project-related-actions
  resources :projects, only: [:show, :edit, :update, :create, :index]
end
