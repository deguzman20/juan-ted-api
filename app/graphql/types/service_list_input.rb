module Types
  class ServiceListInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name "SERVICE_LIST_INPUT"

    argument :quantity, String, required: true
    argument :service_id, String, required: true
    argument :transaction_id, String, required: true
  end
end
