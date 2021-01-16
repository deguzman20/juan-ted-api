# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  text        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
FactoryBot.define do
  factory :notification do
    customer_id { 1 }
    tasker_id { 1 }
    text { "MyString" }
  end
end
