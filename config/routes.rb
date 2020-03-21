Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :create] do
    resources :users, only: [:edit, :update, :show]
  end
end
