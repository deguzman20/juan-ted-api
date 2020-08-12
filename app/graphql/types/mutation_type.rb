module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_tasker, mutation: Mutations::CreateTasker
    field :create_customer, mutation: Mutations::CreateCustomer
    field :create_todo, mutation: Mutations::CreateTodo
    field :create_message, mutation: Mutations::CreateMessage
    field :create_review, mutation: Mutations::CreateReview
    field :customer_signin, mutation: Mutations::SignInCustomer, null: true
    field :add_to_favorate_tasker, mutation: Mutations::AddToFavorateTasker
    field :remove_to_favorate_tasker, mutation: Mutations::RemoveToFavorateTasker
    field :remove_featured_skill, mutation: Mutations::RemoveFeaturedSkill, null: true
    field :tasker_signin, mutation: Mutations::SignInTasker, null: true
    field :forgot_password, mutation: Mutations::ForgotPassword
    field :update_password, mutation: Mutations::ChangePassword
    field :update_customer_geolocation, mutation: Mutations::UpdateCustomerGeolocation, null: true
    field :update_tasker_geolocation, mutation: Mutations::UpdateTaskerGeolocation
    field :update_transaction_status, mutation: Mutations::UpdateTransactionStatus
    field :update_transaction_status_to_done, mutation: Mutations::UpdateTransactionStatusToDone
    field :update_customer_info, mutation: Mutations::UpdateCustomerInfo
    field :update_tasker_info, mutation: Mutations::UpdateTaskerInfo
    field :delete_todo, mutation: Mutations::DeleteTodo
  end
end
