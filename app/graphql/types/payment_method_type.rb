module Types
  # query object for user
  class PaymentMethodType < BaseObject
    description "Payment Method Type"
    field :id, ID, null: true
    field :name, String, null: false
  end
end
