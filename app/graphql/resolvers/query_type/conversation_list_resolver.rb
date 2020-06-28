module Resolvers
  module QueryType
    class ConversationListResolver < GraphQL::Schema::Resolver
      description "List of specific conversation list"
      argument :user_id, Integer, required: true
      argument :is_customer, Boolean, required: true

      type [Types::ConversationType], null: false

      def resolve(** args)
        if args[:is_customer] == true
          Conversation.where(tasker_id: args[:user_id])
        else
          Conversation.where(is_customer: args[:user_id])
        end
      end
    end
  end
end
