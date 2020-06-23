Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
     resources :users, only: [:create]
     post "login", to: "authentication#login"
   end
  end
end
