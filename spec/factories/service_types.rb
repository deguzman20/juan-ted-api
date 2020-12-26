# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :service_type do
    name { "MyString" }
  end
end
