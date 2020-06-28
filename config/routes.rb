Rails.application.routes.draw do
  namespace :customer do
    get "change_password/:id", to: "change_password#change_password", as: :change_password
  end

  devise_for :customers
  devise_for :taskers
  mount ActionCable.server, at: '/cable'
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
