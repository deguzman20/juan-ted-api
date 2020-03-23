# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :service do
    type { "" }
  end
end
