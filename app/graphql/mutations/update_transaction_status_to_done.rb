module Mutations
  # mutation for updating transaction status to done
  class UpdateTransactionStatusToDone < BaseMutation
    description "Update transaction status"
    argument :transaction_id, Integer, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      transaction = Transaction.find(args[:transaction_id]) if args[:transaction_id].present?
      transaction.done = true
      if transaction.save
        { response: "Update was successfully", status_code: 200 }
      else
        { response: transaction.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
