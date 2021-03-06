module Types
  # query object for featured skill
  class NotificationType < BaseObject
    description "Notification type"
    field :id, ID, null: false
    field :customer, Types::CustomerType, null: true
    field :tasker, Types::TaskerType, null: true
    field :text, String, null: false
    field :created_date, String, null: false
  end
end
