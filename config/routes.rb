Rails.application.routes.draw do
  namespace :v1 do
    resources :fishermen do
      resources :fish
    end
  end
end
