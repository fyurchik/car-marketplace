Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :posts do
      member do
        patch :approve
        patch :reject
      end
    end
    root to: 'posts#index'
  end

  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  root "pages#index"

  resources :posts do
    collection do
      get :filter
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
