module Mutations
  # mutation for sign in user
  class SignInTasker < BaseMutation
    description "Sign-in Authentication for tasker"
    argument :email, Types::AuthProviderEmailInput, required: false
    field :token, String, null: true
    field :email, String, null: true
    # field :password, String, null: true

    def resolve(email: nil)
      token = TaskerAuthenticationService.new(email[:email], email[:password]).call
      { token: token }
    end
  end
end
