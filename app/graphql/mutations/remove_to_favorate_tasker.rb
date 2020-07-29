module Mutations
  # mutation for removing to favorate tasker
  class RemoveToFavorateTasker < BaseMutation
    description "Removed to favorate tasker"

    argument :transaction_id, Int, required: true

    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      @transaction = Transaction.find(args[:transaction_id]) if args[:transaction_id].present?
      if @transaction.present?
        @transaction.favorate = false

        if @transaction.save
          { response: "Successfuly removed to your favorate tasker", status_code: 200 }
        else
          { response: @transaction.errors.full_messages.join(""), status_code: 422 }
        end
      else
        { response: "Transaction does'nt exist", status_code: 422 }
      end
    end
  end
end
