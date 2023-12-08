Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  devise_scope :user do
    authenticated :user do
      root :to => "groups#index", as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root :to => "welcome#home", as: :unauthenticated_root
    end
  end
  delete '/groups/:group_id/entities/:id', to: 'entities#destroy', as: 'group_entity'

  resources :groups, only: [:index, :new, :create, :show] do
    resources :entities, only: [:index, :new, :create, :destroy, :edit, :update, :show]
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
