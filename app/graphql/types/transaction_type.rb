module Types
  # query object for transaction
  class TransactionType < BaseObject
    description "Transaction service"
    field :id, ID, null: false
    field :lat, String, null: false
    field :lng, String, null: false
    field :approved, Boolean, null: false
    field :favorate, Boolean, null: false
    field :review, Boolean, null: false
    field :done, Boolean, null: false
    field :from, String, null: false
    field :to, String, null: false
    field :tasker, Types::TaskerType, null: true
    field :customer, Types::CustomerType, null: true
    field :service_type, Types::ServiceTypeType, null: true
    field :transaction_services, [Types::TransactionServiceType], null: true
  end
end
