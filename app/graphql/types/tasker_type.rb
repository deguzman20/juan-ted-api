module Types
  # query object for user
  class TaskerType < BaseObject
    description "Customer Type"
    # graphql_name 'USER_TYPE'
    field :id, ID, null: false
    field :encrypted_password, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :image, String, null: false
    field :mobile_number, String, null: false
    field :email, String, null: false
    field :zip_code, String, null: false
    field :hourly_rate, Float, null: false
    field :introduction, String, null: false
    field :tasks, [Types::TaskType], null: true
  end
end
