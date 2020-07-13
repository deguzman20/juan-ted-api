module Mutations
  # mutation for creating new user
  class CreateCustomer < BaseMutation
    description "Create Customer"

    # base input object for email and password
    class CustomerAuthProviderSignupData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: true
    end

    # Personal Information
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :image, String, required: false
    argument :mobile_number, String, required: true

    argument :auth_provider, CustomerAuthProviderSignupData, required: false
    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(auth_provider: nil, ** args)
      customer = Customer.new(
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password),
        first_name: args[:first_name],
        last_name: args[:last_name],
        mobile_number: args[:mobile_number]
      )
      if customer.save
        { response: "Customer Created", status_code: 200 }
      else
        { response: customer.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
