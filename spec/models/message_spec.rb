# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#
require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
