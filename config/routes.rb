Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    resources :tags, only: %i[create]
  end
end
