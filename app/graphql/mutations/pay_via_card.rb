module Mutations
  # mutation for creating new user
  class PayViaCard < BaseMutation
    description "Pay via card"

    # Personal Information
    argument :token, String, required: true
    argument :amount, Integer, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      gateway = Paymongo::Gateway.new(Paymongo::Configuration.new)
      
      result = gateway.transaction.sale(
        token: args[:token],
        amount: args[:amount],
        currency: "PHP",
        # Below are optional
        description: "Payment for Invoice #0001",
        statement_descriptor: "Local"
      )

      if result.success?
        { response: 'Paid Successfuly', status_code: 200 }
      else
        { response: 'Failed to pay', status_code: 422 }
      end
    end
  end
end
