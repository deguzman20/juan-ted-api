module Mutations
  # mutation for creating new user
  class CreateBulkOfTransactionService < BaseMutation
    description "Transaction Service"

    # argument :obj, Types::TodoType, required: true
    field :transaction_service, Types::TransactionServiceType, null: false
    
    def resolve
    end
  end
end