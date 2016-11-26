Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :flag
      resources :random
      resources :category
      resources :reasons
    end
  end
end
