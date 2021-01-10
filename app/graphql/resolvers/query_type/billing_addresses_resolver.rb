module Resolvers
  module QueryType
    class BillingAddressesResolver < GraphQL::Schema::Resolver
      description "List of billing addresses"
      argument :customer_id, Integer, required: true

      type [Types::BillingAddressType], null: false

      def resolve(** args)
        ::BillingAddress.where(customer_id: args[:customer_id]) if args[:customer_id].present?
      end
    end
  end
end
