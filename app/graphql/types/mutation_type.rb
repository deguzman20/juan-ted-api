module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_tasker, mutation: Mutations::CreateTasker
    field :create_customer, mutation: Mutations::CreateCustomer
    field :customer_signin, mutation: Mutations::SignInCustomer
    field :tasker_signin, mutation: Mutations::SignInTasker
  end
end
