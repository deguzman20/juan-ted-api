module Resolvers
  module QueryType
    class PendingTransactionServiceInfoResolver < GraphQL::Schema::Resolver
      description "Transaction info"

      argument :transaction_id, Integer, required: true

      type Types::TransactionType, null: false

      def resolve(** args)
        ::Transaction.find(args[:transaction_id]) if args.present?
      end
    end
  end
end
