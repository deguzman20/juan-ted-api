Rails.application.routes.draw do
  namespace :tasker do
    get 'upload/index'
    get 'upload/new'
    get 'upload/message'
    get 'upload/create'
    get 'upload/edit'
    get 'upload/update'
  end
  namespace :customer do
    get 'upload/index'
    get 'upload/new'
    get 'upload/create'
    get 'upload/edit'
    get 'upload/update'
  end
  get 'checkout/redirect_to_paypal'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :customer do
    get "change_password/:id", to: "change_password#change_password", as: :change_password
    get "create_transaction", to: "transactions#create_transaction"
    get "create_bulk_of_transaction_service", to: "transactions#create_bulk_of_transaction_service"
    post "update_customer_image", to: "customer_image#update_customer_image"
    # post "upload_image", to: "upload_image#customer_upload_image"
    resources :upload
    post '/upload/edit', to: 'upload#edit'
    post '/upload/update', to: 'upload#update'
    get 'upload/message/result', to: 'upload#message'
  end

  namespace :tasker do
    resources :upload
    post '/upload/edit', to: 'upload#edit'
    post '/upload/update', to: 'upload#update'
    get 'upload/message/result', to: 'upload#message'
  end

  devise_for :customers
  devise_for :taskers

  mount ActionCable.server, at: "/cable"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  get '/redirect_to_paypal', to: 'checkout#redirect_to_paypal', as: :paypal
  get '/paypals', to: 'checkout#redirect'
  get '/execute', to: 'checkout#execute'


  resources :tasker, only: [:new]
  get "/tasker", to: "tasker#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
