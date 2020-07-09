module Types
  # query object for todo
  class TransactionServiceType < BaseObject
    description "Transaction service"
    field :id, ID, null: false
    field :transaction_id, ID, null: false
    field :customer_id, ID, null: false
    field :quantity, Integer, null: false
  end
end
