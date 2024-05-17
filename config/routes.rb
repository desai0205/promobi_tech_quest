Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, path: '', defaults: { format: :json }do
    namespace :v1 do
      resources :courses, only: [:index, :create], path: '/courses', as: 'courses'
    end
  end
end
