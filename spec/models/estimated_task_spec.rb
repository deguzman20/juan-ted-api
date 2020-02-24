# == Schema Information
#
# Table name: estimated_tasks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe EstimatedTask, type: :model do
  it { is_expected.to have_many(:tasks) }
end
