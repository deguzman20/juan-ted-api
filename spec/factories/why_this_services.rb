# == Schema Information
#
# Table name: why_this_services
#
#  id         :bigint           not null, primary key
#  reason     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
FactoryBot.define do
  factory :why_this_service do
    service_id { 1 }
    reason { "MyString" }
  end
end
