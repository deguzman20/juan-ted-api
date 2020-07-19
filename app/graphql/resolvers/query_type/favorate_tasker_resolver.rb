module Resolvers
  module QueryType
    class FavorateTaskerResolver < GraphQL::Schema::Resolver
      description "List of all past tasker"

      argument :customer_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        ::Transaction.where(customer_id: args[:customer_id])
                     .where(favorate: true)  if args.present?
      end
    end
  end
end
