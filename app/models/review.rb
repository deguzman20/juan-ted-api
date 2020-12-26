# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  comment         :text
#  rating          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :integer
#  service_type_id :integer
#  tasker_id       :integer
#
class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :tasker
  belongs_to :service_type
end
