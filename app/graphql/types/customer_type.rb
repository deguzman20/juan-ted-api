module Types
  # query object for user
  class CustomerType < BaseObject
    description "Customer Type"
    field :id, ID, null: false
    field :encrypted_password, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :image, String, null: true
    field :mobile_number, String, null: false
    field :zip_code, String, null: false
    field :card_detail, String, null: false
    field :email, String, null: false
    field :tasks, [Types::TaskType], null: true
  end
end
