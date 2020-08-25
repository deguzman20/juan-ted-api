module Resolvers
  module QueryType
    class MostHelpfulReviewsResolver < GraphQL::Schema::Resolver
      description "List of most helpful review"

      argument :service_id, Integer, required: true
      type [Types::ReviewType], null: false

      def resolve(** args)
        ::Service.find(args[:service_id]).service_type.reviews if args.present?
      end
    end
  end
end
