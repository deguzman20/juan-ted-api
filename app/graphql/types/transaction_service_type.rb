module Types
  # query object for transaction service
  class TransactionServiceType < BaseObject
    description "Transaction service"
    field :id, ID, null: false
    field :transaction_id, ID, null: false
    field :service_id, ID, null: false
    field :quantity, Integer, null: false
  end
end
