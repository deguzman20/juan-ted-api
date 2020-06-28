module Types
  # query object for user
  class MessageType < BaseObject
    description "Chat Message Type"
    field :id, ID, null: true
    field :conversation_id, ID, null: true
    field :text, String, null: false
    field :created_at, String, null: false
  end
end
  