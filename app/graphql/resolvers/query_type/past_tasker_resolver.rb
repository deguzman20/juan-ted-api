module Resolvers
  module QueryType
    class PastTaskerResolver < GraphQL::Schema::Resolver
      description "List of all past tasker"

      argument :customer_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        if args.present?
          ::Transaction.where(customer_id: args[:customer_id])
                       .where(done: true).uniq
        end
      end
    end
  end
end
