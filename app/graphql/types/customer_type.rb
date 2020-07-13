module Types
  # query object for user
  class CustomerType < BaseObject
    description "Customer Type"
    field :id, ID, null: false
    field :encrypted_password, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :formatted_address, String, null: true
    field :image, String, null: true
    field :mobile_number, String, null: false
    field :zip_code, String, null: false
    field :card_detail, String, null: false
    field :email, String, null: false
    field :auth_token, String, null: false
    field :lng, String, null: true
    field :lat, String, null: true
    field :tasks, [Types::TaskType], null: true
    field :reviews, [Types::ReviewType], null: true
    field :todos, [Types::TodoType], null: true
    field :conversations, [Types::ConversationType], null: true
    field :transactions, [Types::TransactionType], null: true
  end
end
