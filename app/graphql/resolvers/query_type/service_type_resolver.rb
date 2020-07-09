module Resolvers
  module QueryType
    class ServiceTypeResolver < GraphQL::Schema::Resolver
      description "List of all service type"

      type [Types::ServiceTypeType], null: false

      def resolve
        ::ServiceType.all
      end
    end
  end
end
