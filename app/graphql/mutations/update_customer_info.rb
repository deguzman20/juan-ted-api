module Mutations
  # mutation for updating customer info
  class UpdateCustomerInfo < BaseMutation
    description "Update customer info"
    argument :customer_id, Integer, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :email, String, required: false
    argument :mobile_number, String, required: false

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      customer = Customer.find(args[:customer_id])
      customer.first_name = args[:first_name] if args[:first_name] != "" || !args[:first_name].nil?
      customer.last_name = args[:last_name] if args[:last_name] != "" || !args[:last_name].nil?
      customer.email = args[:email] if args[:email] != "" || !args[:email].nil?
      customer.mobile_number = args[:mobile_number] if args[:mobile_number] != "" || !args[:mobile_number].nil?

      if customer.save!
        { response: "Customer info was updated!", status_code: 200 }
      else
        { response: customer.errors.full_message.join(""), status_code: 422 }
      end
    end
  end
end
