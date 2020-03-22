Rails.application.routes.draw do
  get 'missions/update'
  resources :games, only: [:index, :show, :new, :create] do
    resources :users, only: [:edit, :update, :show]
    resources :missions, only: [:update]
  end
end
