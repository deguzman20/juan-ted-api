class MessageRepository
  def last_for_conversation(conversation_id:)
    Message
      .where(conversation_id: conversation_id)
      .order(created_at: :desc)
      .first
  end

  def latest_for_conversation(conversation_id:)
    Message
      .where(conversation_id: conversation_id)
      .order(created_at: :desc)
      .limit(10)
      .reverse
  end

  def create_in_room(conversation_id:, text:, own_by_customer:)
    Message.create(conversation_id: conversation_id, text: text, own_by_customer: own_by_customer).tap do |message|
      JuanTedApiSchema.subscriptions.trigger(:message_added_to_conversation, { conversation_id: conversation_id }, message)
    end
  end
end
