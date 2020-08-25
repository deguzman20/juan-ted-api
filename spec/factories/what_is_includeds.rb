# == Schema Information
#
# Table name: what_is_includeds
#
#  id         :bigint           not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
FactoryBot.define do
  factory :what_is_included do
    service_id { 1 }
    text { "MyString" }
  end
end
