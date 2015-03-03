Rails.application.routes.draw do
  namespace :v1 do
    resources :users do
      resources :fish
    end
  end
end
