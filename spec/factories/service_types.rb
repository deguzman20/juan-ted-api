# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :service_type do
    name { "MyString" }
  end
end
