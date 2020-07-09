module Types
  # query object for user
  class SubscriptionType < Types::BaseObject
    description "Subscription Type"
    # field :message_added_to_conversation, subscription: Resolvers::SubscriptionType::ConversationResolver, null: true

    field :message_added_to_conversation, Types::MessageType, null: false do
      argument :conversation_id, Integer, required: true
    end

    def message_added_to_conversation(conversation_id:)
      object
    end

    # extend GraphQL::Subscriptions::SubscriptionRoot
  end
end
