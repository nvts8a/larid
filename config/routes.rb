Rails.application.routes.draw do
  namespace :v1 do
    resources :session, only: [:create]
    resources :geolocation, only: [:index]
    resources :users do
      resources :activities
    end
  end
end
