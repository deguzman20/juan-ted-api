# == Schema Information
#
# Table name: transactions
#
#  id              :bigint           not null, primary key
#  approved        :boolean          default(FALSE)
#  done            :boolean          default(FALSE)
#  favorate        :boolean          default(FALSE)
#  from            :datetime
#  lat             :decimal(10, 6)
#  lng             :decimal(10, 6)
#  to              :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :integer
#  service_type_id :integer
#  tasker_id       :integer
#
FactoryBot.define do
  factory :transaction do
    customer_id { 1 }
    tasker_id { 1 }
    approved { false }
  end
end
