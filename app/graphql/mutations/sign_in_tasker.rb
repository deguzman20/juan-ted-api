module Mutations
  # mutation for sign in user
  class SignInTasker < BaseMutation
    description "Sign-in Authentication for tasker"
    argument :email, Types::AuthProviderEmailInput, required: false
    type Types::TaskerType

    field :email, String, null: true

    def resolve(email: nil)
      TaskerAuthenticationService.call(email[:email], email[:password])
    end
  end
end
