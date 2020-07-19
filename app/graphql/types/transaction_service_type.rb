module Types
  # query object for transaction service
  class TransactionServiceType < BaseObject
    description "Transaction service"
    field :id, ID, null: false
    field :transaction, Types::TransactionType, null: false
    field :service, Types::ServiceType, null: false
    field :quantity, Integer, null: false
  end
end
