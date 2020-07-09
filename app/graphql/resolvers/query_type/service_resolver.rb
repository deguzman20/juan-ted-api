module Resolvers
  module QueryType
    class ServiceResolver < GraphQL::Schema::Resolver
      description "List of all service"

      argument :service_type_id, Integer, required: true

      type [Types::ServiceType], null: false

      def resolve(** args)
        ::Service.where(service_type_id: args[:service_type_id]) unless args[:service_type_id].nil?
      end
    end
  end
end
