module Types
  # query object for user
  class EquipmentUseType < BaseObject
    description "Equipment use type"
    field :id, ID, null: false
    field :text, String, null: false
    field :service, Types::ServiceType, null: true
  end
end
