module Types
  # query object for service
  class ServiceType < BaseObject
    description "Service Type"
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :image, String, null: false
    field :price, Float, null: false
    field :equipment_uses, [Types::EquipmentUseType], null: true
    field :what_is_includeds, [Types::WhatIsIncludedType], null: true
    field :why_this_services, [Types::WhyThisServiceType], null: true
  end
end
