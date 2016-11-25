Rails.application.routes.draw do
  resources :reasons
  namespace :api do
    namespace :v1 do
      resources :random
      resources :category
      resources :reasons
    end
  end
end
