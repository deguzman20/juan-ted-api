# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe ServiceType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
