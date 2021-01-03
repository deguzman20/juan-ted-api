# == Schema Information
#
# Table name: equipment_uses
#
#  id         :bigint           not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require 'rails_helper'

RSpec.describe EquipmentUse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
