module Resolvers
  module QueryType
    class UnselectedServiceTypeResolver < GraphQL::Schema::Resolver
      description "List of unselected service type"

      argument :unselected_service_type, String, required: true

      type [Types::ServiceTypeType], null: false

      def resolve(** args)
        if args[:unselected_service_type] != ""
          ::ServiceType.where('id NOT IN (?)', args[:unselected_service_type].split(',').map(&:to_i))
        else
          ::ServiceType.all
        end
      end
    end
  end
end
