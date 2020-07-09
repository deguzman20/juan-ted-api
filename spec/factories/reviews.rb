# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :text(65535)
#  rating      :float(24)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  service_id  :integer
#  tasker_id   :integer
#
FactoryBot.define do
  factory :review do
    ratings { 1.5 }
    comments { "MyText" }
    customer_id { 1 }
    tasker_id { 1 }
    service_id { 1 }
  end
end
