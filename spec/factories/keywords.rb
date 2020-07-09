# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  keyword    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
FactoryBot.define do
  factory :keyword do
    service_id { 1 }
    keyword { "MyString" }
  end
end
