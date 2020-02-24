# == Schema Information
#
# Table name: estimated_tasks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EstimatedTask < ApplicationRecord
  has_many :tasks
end
