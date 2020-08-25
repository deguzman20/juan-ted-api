module Types
  class WhyThisServiceType < BaseObject
    description "why this service type"
    field :id, ID, null: false
    field :reason, String, null: false
    field :service, Types::ServiceType, null: true
  end
end
