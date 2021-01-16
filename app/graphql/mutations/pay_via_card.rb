module Mutations
  # mutation for creating new user
  class PayViaCard < BaseMutation
    description "Pay via card"

    # Personal Information
    argument :token, String, required: true
    argument :amount, Integer, required: true
    argument :customer_id, Integer, required: true
    argument :tasker_id, Integer, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      @transaction = Transaction.where(customer_id: args[:customer_id]).last
      @conversation = Conversation.new

      gateway = Paymongo::Gateway.new(Paymongo::Configuration.new)
      
      result = gateway.transaction.sale(
        token: args[:token],
        amount: args[:amount]+ 10000,
        currency: "PHP",
        # Below are optional
        description: "Payment for Invoice #000#{@transaction.id}",
        statement_descriptor: "Local"
      )

      @transaction.paid = true
      @transaction.approved = true
      @conversation.customer_id = args[:customer_id]
      @conversation.tasker_id = args[:tasker_id]
      if result.success? && @transaction.save && @conversation.save
          { response: 'Paid Successfuly', status_code: 200 }
      else
        { response: 'Failed to pay', status_code: 422 }
      end
    end
  end
end
