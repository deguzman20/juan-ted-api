module Resolvers
  module MutationType
    class SignInCustomerResolver < GraphQL::Schema::Resolver
      description "Sign-in Authentication for customer"
      argument :email, Types::AuthProviderEmailInput, required: false
      field :token, String, null: true
      field :email, String, null: true

      def resolve(email: nil)
        auth_token = CustomerAuthenticationService.call(email[:email], email[:password])
        { token: auth_token }
      end
    end
  end
end
