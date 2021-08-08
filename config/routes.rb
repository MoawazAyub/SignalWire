Rails.application.routes.draw do
  namespace :api do
    resources :tags, only: %i[create]
  end
end
