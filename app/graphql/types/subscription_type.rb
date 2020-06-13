module Types
  # query object for user
  class SubscriptionType < BaseObject
    description "Subscription Type"
    field :message_added, Types::MessageType, null: false do
      argument :user_id
    end

    def message_added(user_id)
      object
    end
  end
end
