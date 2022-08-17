Rails.application.routes.draw do 
   devise_for :users,
    controllers: {
      registrations: :registrations,
      sessions: :sessions,
    }
 
  namespace :api do
    namespace :v1 do   
      resources :cities, only: [:index, :show, :create, :destroy] do
        resources :cars, only: [:create, :destroy] do
          resources :reservations, only: [:index, :create, :destroy]
        end
      end
    end
  end
end
