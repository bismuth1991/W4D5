Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new]
  end

  resources :goals, only: [:show, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
end
