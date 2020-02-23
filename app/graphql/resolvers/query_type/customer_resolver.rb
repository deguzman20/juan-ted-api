module Resolvers
  module QueryType
    class CustomerResolver < GraphQL::Schema::Resolver
      argument :id, Integer, required: true
      description "Single Customer"

      type [Types::CustomerType], null: false

      def resolve(** args)
        ::Customer.where(id: args[:id]) unless args[:id].nil?
      end
    end
  end
end
