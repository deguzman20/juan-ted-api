module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_tasker, mutation: Mutations::CreateTasker
    field :create_customer, mutation: Mutations::CreateCustomer
    field :create_bulk_of_transaction_service, mutation: Mutations::CreateBulkOfTransactionService
    field :customer_signin, mutation: Mutations::SignInCustomer, null: true
    field :tasker_signin, mutation: Mutations::SignInTasker, null: true
    field :forgot_password, mutation: Mutations::ForgotPassword
    field :update_password, mutation: Mutations::ChangePassword
    field :create_todo, mutation: Mutations::CreateTodo
    field :create_message, mutation: Mutations::CreateMessage
    field :delete_todo, mutation: Mutations::DeleteTodo
  end
end
