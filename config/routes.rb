Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get 'antipode', to: 'antipodes#index'
    end
  end
end
