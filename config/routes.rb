Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
     resources :covidpoints, only: [:index, :create, :destroy, :update]
    end
  end

  root to: 'homepage#index'
end