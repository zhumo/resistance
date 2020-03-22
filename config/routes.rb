Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :create] do
    resources :users, only: [:edit, :update, :show]
    resources :missions, only: [:update]
    resources :mission_teams, only: [:show, :new, :create]
  end
end
