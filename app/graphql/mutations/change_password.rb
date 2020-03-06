module Mutations
  # mutation for creating new user
  class ChangePassword < BaseMutation
    description "Forgot Password"

    argument :id, Integer, required: true
    argument :new_password, String, required: true
    argument :confirm_password, String, required: true
    argument :customer, Boolean, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false
    field :email, String, null: false

    def resolve(_email: nil, **args)
      customer_change_password = ChangePasswordService.call(args[:id], args[:new_password],
                                                            args[:confirm_password], args[:customer])
      if context[:current_user].present?
        if customer_change_password.present?
          { response: customer_change_password, status_code: 200 }
        else
          { response: "Password and confirm password doesn't match", status_code: 422 }
        end
      else
        { response: "Unauthorized", status_code: 401 }
      end
    end
  end
end
