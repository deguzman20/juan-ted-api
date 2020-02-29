module Mutations
  # mutation for sign in user
  class SignInCustomer < BaseMutation
    description "Sign-in Authentication for customer"
    argument :email, Types::AuthProviderEmailInput, required: false
    field :response, Types::CustomerType, null: true
    # field :token, String, null: true
    field :email, String, null: true

    def resolve(email: nil)
      customer = CustomerAuthenticationService.call(email[:email], email[:password])
      { response: customer }
    end
  end
end
