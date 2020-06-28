# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :customer, optional: true
  belongs_to :tasker, optional: true
end
