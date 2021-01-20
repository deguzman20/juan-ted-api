# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  created_date :string(255)
#  text         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  customer_id  :integer
#  tasker_id    :integer
#
class Notification < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :tasker, optional: true
end
