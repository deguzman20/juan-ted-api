module Resolvers
  module QueryType
    class TransactionServiceResolver < GraphQL::Schema::Resolver
      description "transaction service of specific transaction"

      argument :transaction_id, Integer, required: true

      type Types::TransactionType, null: false

      def resolve(** args)
        ::Transaction.find(args[:transaction_id]) unless args[:transaction_id].nil?
      end
    end
  end
end
