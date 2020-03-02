module Resolvers
  module QueryType
    class ReviewsResolver < GraphQL::Schema::Resolver
      description "List of all reviews"

      type [Types::ReviewType], null: false

      def resolve
        ::Review.all
      end
    end
  end
end
