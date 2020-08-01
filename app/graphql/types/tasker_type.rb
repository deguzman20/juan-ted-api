module Types
  # query object for user
  class TaskerType < BaseObject
    description "Tasker Type"
    # graphql_name 'USER_TYPE'
    field :id, ID, null: false
    field :encrypted_password, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :formatted_address, String, null: true
    field :image, String, null: false
    field :mobile_number, String, null: false
    field :email, String, null: false
    field :zip_code, String, null: false
    field :hourly_rate, Float, null: false
    field :introduction, String, null: false
    field :auth_token, String, null: false
    field :lng, String, null: true
    field :lat, String, null: true
    field :tasks, [Types::TaskType], null: true
    field :conversations, [Types::ConversationType], null: true
    field :reviews, [Types::ReviewType], null: false
    field :featured_skills, [Types::FeaturedSkillType], null: true
  end
end
