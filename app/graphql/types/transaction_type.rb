module Types
  # query object for transaction
  class TransactionType < BaseObject
    description "Transaction service"
    field :id, ID, null: false
    field :tasker, Types::TaskerType, null: true
    # field :customer_id, ID, null: false
    field :lat, String, null: false
    field :lng, String, null: false
    field :approved, Boolean, null: false
    field :start_from, String, null: false
    field :start_to, String, null: false
  end
end
