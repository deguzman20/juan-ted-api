module Types
  class BillingAddressType < BaseObject
    description "Billing Address Type"
    field :id, ID, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :address_line_one, String, null: true
    field :address_line_two, String, null: true
    field :state, String, null: true
    field :postal_code, String, null: true
    field :country, String, null: true
    field :email, String, null: true
    field :mobile_number, String, null: true
  end
end
