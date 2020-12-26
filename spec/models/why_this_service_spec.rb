# == Schema Information
#
# Table name: why_this_services
#
#  id         :bigint           not null, primary key
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require 'rails_helper'

RSpec.describe WhyThisService, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
