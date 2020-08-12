module Resolvers
  module QueryType
    class UnselectedServiceTypeResolver < GraphQL::Schema::Resolver
      description "List of unselected service type"

      argument :unselected_service_type, String, required: true

      type [Types::ServiceTypeType], null: false

      def resolve(** args)
        ::ServiceType.where('id NOT IN (?)', args[:unselected_service_type].split(',').map(&:to_i)) unless args[:unselected_service_type].nil?
      end
    end
  end
end
