module Resolvers
  module QueryType
    class PendingTransactionResolver < GraphQL::Schema::Resolver
      description "List of pending transaction"
      argument :tasker_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        ::Transaction.where(tasker_id: args[:tasker_id]).where(approved: false) if args[:tasker_id].present?
      end
    end
  end
end
