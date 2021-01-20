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
FactoryBot.define do
  factory :message do
    conversation_id { 1 }
  end
end
