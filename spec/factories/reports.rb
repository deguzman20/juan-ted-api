# == Schema Information
#
# Table name: reports
#
#  id          :bigint           not null, primary key
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
FactoryBot.define do
  factory :report do
    customer_id { 1 }
    tasker_id { 1 }
    image { "MyString" }
  end
end
