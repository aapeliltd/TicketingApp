Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
     resources :users, only: [:create]
     post "login", to: "authentication#login"
     post "ticket/close", to: "tickets#close"
     get  "ticket/:id/comments", to: "comments#get_ticket_comments"
     post "ticket/:id/comments", to: "comments#create_comment"
     get  "users/:id/tickets", to: "tickets#get_user_tickets"
     post "ticket/survey", to: "surveys#create"
     resources :tickets, only: [:index, :create]
     
   end
  end
end
