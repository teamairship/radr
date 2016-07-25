Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'

  root 'sites#index'

  resources :sites, only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ping, only: :new
    end
  end
end
