module Mutations
  # mutation for sign in user
  class SignInTasker < BaseMutation
    description "Sign-in Authentication for tasker"
    argument :email, Types::AuthProviderEmailInput, required: false
    field :response, Types::TaskerType, null: true
    field :email, String, null: true

    def resolve(email: nil)
      tasker = TaskerAuthenticationService.call(email[:email], email[:password])
      { response: tasker }
    end
  end
end
