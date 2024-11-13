Rails.application.routes.draw do
  get 'activity/index'
  get 'executives/index'
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  get 'members/bargaining_team', to: 'members#bargaining_team', as: 'bargaining_team'

  resources :posts

  resources :users, except: [:new, :create]

  resources :events

  resources :members

  resources :subgroups, only: [:index, :show]

  resources :executives, only: [:index]

  resources :tags, only: [:index]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
