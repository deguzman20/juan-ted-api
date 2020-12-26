module Mutations
  # mutation for creating new user
  class GcashGrab < BaseMutation
    description "Gcash Grab"

    # base input object for email and password
    # class ForgotPasswordData < Types::BaseInputObject
    #   argument :email, Types::AuthProviderEmailInput, required: false
    # end

    argument :type_of_payment, String, required: false
    argument :amount, String, required: false
    argument :currency, String, required: false
    argument :redirect_to_success, String, required: false
    argument :redirect_to_failed, String, required: false

    argument :name, String, required: false
    argument :mobile_no, String, required: false
    argument :email, String, required: false
    argument :address_line_one, String, required: false
    argument :address_line_two, String, required: false
    argument :state, String, required: false
    argument :city, String, required: false
    argument :postal_code, String, required: false
    argument :country, String, required: false
    argument :address, String, required: false

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(type_of_payment: nil, amount: nil, 
                  currency: nil, redirect_to_success: nil, 
                  redirect_to_failed: nil, 
                  name: nil, mobile_no: nil, 
                  email: nil, address_line_one: nil, address_line_two: nil, state: nil, city: nil, postal_code: nil, country: nil, address: nil)
      payment_response = GcashGrabPaymentService.call(type_of_payment, amount, currency, redirect_to_success, 
      redirect_to_failed, name, mobile_no, email, address_line_one, address_line_two, state, city, postal_code, country, address)
      { response: payment_response, status_code: 200 }
    end
  end
end