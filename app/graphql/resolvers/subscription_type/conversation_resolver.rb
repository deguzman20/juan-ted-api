module Resolvers
  module SubscriptionType
    class ConversationResolver < GraphQL::Schema::Resolver
      description "List of specific conversation"
      argument :conversation_id, Integer, required: true

      type Types::MessageType, null: true

      def resolve(** args)
        if args[:conversation_id].present?
          Message.where(conversation_id: args[:conversation_id]).last
        else
          {}
        end
      end
    end
  end
end
  