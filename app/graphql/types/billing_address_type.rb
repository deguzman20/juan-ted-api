module Types
  class BillingAddressType < BaseObject
    description "Billing Address Type"
    field :id, ID, null: true
    field :address_line_one, String, null: true
    field :address_line_two, String, null: true
    field :state, String, null: true
    field :postal_code, String, null: true
  end
end
