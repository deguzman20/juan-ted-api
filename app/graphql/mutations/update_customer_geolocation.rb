module Mutations
  # mutation for creating todo
  class UpdateCustomerGeolocation < BaseMutation
    description "Update customer geolocation"
    argument :customer_id, Integer, required: true
    argument :lng, String, required: true
    argument :lat, String, required: true
    argument :formatted_address, String, required: false
    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      customer = Customer.find(args[:customer_id])
      customer.lng = args[:lng].to_d
      customer.lat = args[:lat].to_d
      customer.formatted_address = args[:formatted_address]
      if customer.save
        { response: "Update was successfully", status_code: 200 }
      else
        { response: customer.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
