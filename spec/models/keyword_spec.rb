# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  keyword    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require "rails_helper"

RSpec.describe Keyword, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
