# == Schema Information
#
# Table name: why_this_services
#
#  id         :bigint           not null, primary key
#  reason     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
class WhyThisService < ApplicationRecord
  belongs_to :service, optional: true
end
