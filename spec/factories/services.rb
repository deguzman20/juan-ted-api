# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :service do
    type { "" }
  end
end
