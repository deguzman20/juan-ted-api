module Resolvers
  module QueryType
    class CustomerReportResolver < GraphQL::Schema::Resolver
      description "List of customer Report"
      argument :tasker_id, Integer, required: true

      type [Types::ReportType], null: false

      def resolve(** args)
        ::Report.where(tasker_id: args[:tasker_id]) if args[:tasker_id].present?
      end
    end
  end
end
