Rails.application.routes.draw do
  namespace :api, format: :jsonapi do
    namespace :v1 do
      resources :orders, only: [:index, :show, :create, :update]
    end
  end
end
