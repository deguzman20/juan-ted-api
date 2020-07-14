module Mutations
  # mutation for creating new user
  class CreateBulkOfTransactionService < BaseMutation
    description "Transaction Service"

    class ServiceListInputData < Types::BaseInputObject
      argument :services, Types::ServiceListInput, required: false
    end

    argument :service_list, [ServiceListInputData], required: false

    # argument :obj, Types::TodoType, required: true
    field :transaction_service, Types::TransactionServiceType, null: false

    def resolve(**args); end
  end
end
