module Types
  # query object for report
  class ReportType < BaseObject
    description "Report Type"
    field :id, ID, null: false
    field :customer, Types::CustomerType, null: false
    field :tasker, Types::TaskerType, null: false
    field :valid_report, Boolean, null: false
    field :image, String, null: true
    field :reason, String, null: false
    field :created_at, String, null: false 
  end
end
 