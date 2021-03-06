# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  created_date    :string(255)
#  own_by_customer :boolean
#  text            :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#
class Message < ApplicationRecord
  belongs_to :conversation
end
