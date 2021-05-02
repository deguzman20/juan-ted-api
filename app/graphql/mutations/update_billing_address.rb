module Mutations
  # mutation for updating billing address
  class UpdateBillingAddress < BaseMutation
    description "Update Billing Address"
    argument :billing_address_id, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :address_line_one, String, required: true
    argument :address_line_two, String, required: true
    argument :city, String, required: true
    argument :postal_code, String, required: true
    argument :email, String, required: true
    argument :mobile_number, String, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      @billing_address = BillingAddress.find(args[:billing_address_id].to_i)
      @billing_address.first_name = args[:first_name]
      @billing_address.last_name = args[:last_name]
      @billing_address.address_line_one = args[:address_line_one]
      @billing_address.address_line_two = args[:address_line_two]
      @billing_address.postal_code = args[:postal_code]
      @billing_address.email = args[:email]
      @billing_address.mobile_number = args[:mobile_number]

      if @billing_address.save
        { response: "Billing Address Successfuly updated", status_code: 200 }
      else
        { response: @billing_address.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
