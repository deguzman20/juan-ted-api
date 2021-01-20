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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
