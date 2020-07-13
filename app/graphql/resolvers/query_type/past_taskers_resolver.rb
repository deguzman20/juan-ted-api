module Resolvers
  module QueryType
    class PastTaskersResolver < GraphQL::Schema::Resolver
      description "List of all reviews"

      type [Types::TransactionType], null: false

      def resolve
        ::Transaction.where(customer_id: 1)
      end
    end
  end
end
