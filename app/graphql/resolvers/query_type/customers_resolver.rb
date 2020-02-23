module Resolvers
  module QueryType
    class CustomersResolver < GraphQL::Schema::Resolver
      description "List of all customers"

      type [Types::CustomerType], null: false

      def resolve
        ::Customer.all
      end
    end
  end
end
