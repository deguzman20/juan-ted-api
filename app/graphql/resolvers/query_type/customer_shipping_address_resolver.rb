module Resolvers
  module QueryType
    class CustomerShippingAddressResolver < GraphQL::Schema::Resolver
      description "customer shipping address list"
      argument :customer_id, Integer, required: true

      type [Types::TransactionType], null: false

      def resolve(** args)
        unless args[:customer_id].nil?
          ::Transaction.where(customer_id: args[:customer_id])
        end
      end
    end
  end
end
