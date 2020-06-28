module Resolvers
  module QueryType
    class ConversationMessagesResolver < GraphQL::Schema::Resolver
      description "List of specific conversation"
      argument :conversation_id, Integer, required: true

      type [Types::MessageType], null: false

      def resolve(** args)
        ::Message.where(conversation_id: args[:conversation_id]) if args[:conversation_id].present?
      end
    end
  end
end
