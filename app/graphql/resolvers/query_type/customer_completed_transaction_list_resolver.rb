module Resolvers
  module QueryType
    class CustomerCompletedTransactionListResolver < GraphQL::Schema::Resolver
      description "completed transaction list"
      argument :customer_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        unless args[:customer_id].nil?
          ::Transaction.where(customer_id: args[:customer_id])
                       .where(approved: true)
                       .where(done: true)
                       .where(paid: true)
        end
      end
    end
  end
end
