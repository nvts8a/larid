Rails.application.routes.draw do
  namespace :v1 do
    resources :sessions, only: [:create]
    resources :geolocation, only: [:index]
    resources :users, only: [:index, :show, :create, :destroy, :update] do
      resources :activities, only: [:index, :show, :create, :destroy, :update]
    end
  end
end
