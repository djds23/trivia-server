Rails.application.routes.draw do
  get '/support', to: redirect('http://djds23.github.io/')
  namespace :api do
    namespace :v1 do
      resources :flag
      resources :random
      resources :category
      resources :reasons
    end
  end
end
