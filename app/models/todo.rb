# == Schema Information
#
# Table name: todos
#
#  id               :bigint           not null, primary key
#  todo_description :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer
#  service_id       :integer
#
class Todo < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :service, optional: true
end
