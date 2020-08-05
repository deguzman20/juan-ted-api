module Resolvers
  module QueryType
    class CustomerScheduledTransactionListResolver < GraphQL::Schema::Resolver
      description "scheduled transaction list"
      argument :customer_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        ::Transaction.where(customer_id: args[:customer_id])
                      .where(approved: true)
                      .where(done: false) unless args[:customer_id].nil?
      end
    end
  end
end