Rails.application.routes.draw do
  namespace :v1 do
    resources :geolocation, only: [:index]
    resources :users do
      resources :fish
    end
  end
end
