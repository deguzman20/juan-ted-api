Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :customer do
    get "change_password/:id", to: "change_password#change_password", as: :change_password
    get "create_transaction", to: "transactions#create_transaction"
    get "create_bulk_of_transaction_service", to: "transactions#create_bulk_of_transaction_service"
    post "update_customer_image", to: "customer_image#update_customer_image"
  end

  devise_for :customers
  devise_for :taskers

  mount ActionCable.server, at: "/cable"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
