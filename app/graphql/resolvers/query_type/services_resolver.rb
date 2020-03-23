module Resolvers
  module QueryType
    class ServicesResolver < GraphQL::Schema::Resolver
      description "List of all service"

      type [Types::ServiceType], null: false

      def resolve
        ::Service.all
      end
    end
  end
end
