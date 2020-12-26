# == Schema Information
#
# Table name: equipment_uses
#
#  id         :bigint           not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
FactoryBot.define do
  factory :equipment_use do
    text { "MyString" }
  end
end
