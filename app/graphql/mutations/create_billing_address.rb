module Mutations
  # mutation for creating review
  class CreateBillingAddress < BaseMutation
    description "Create Billing Address"
    argument :customer_id, Integer, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :address_line_one, String, required: true
    argument :address_line_two, String, required: true
    argument :city, String, required: true
    argument :state, String, required: true
    argument :postal_code, String, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      @billing_address = BillingAddress.new(
                          customer_id: args[:customer_id],
                          first_name: args[:first_name],
                          last_name: args[:last_name],
                          address_line_one: args[:address_line_one],
                          address_line_two: args[:address_line_two],
                          city: args[:city],
                          state: args[:state],
                          postal_code: args[:postal_code]
                        )

      if @billing_address.save
        { response: "Billing Address Created", status_code: 200 }
      else
        { response: @billing_address.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
