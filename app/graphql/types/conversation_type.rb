module Types
  # query object for user
  class ConversationType < BaseObject
    description "Conversation Message Type"
    field :id, ID, null: false
    field :customer, Types::CustomerType, null: true
    field :tasker, Types::TaskerType, null: true
    field :messages, [Types::MessageType], null: true
  end
end
