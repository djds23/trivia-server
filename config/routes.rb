Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :random
      resources :category
    end
  end
end
