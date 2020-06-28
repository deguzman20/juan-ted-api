module Mutations
  class CreateMessage < BaseMutation
    # argument :conversation_id, Integer, required: false
    argument :customer_id, Integer, required: true
    argument :tasker_id, Integer, required: true
    argument :text, String, required: true

    field :message, Types::MessageType, null: false

    def resolve(customer_id:, tasker_id:, text:)
      @convesation_id = nil
      @conversation = Conversation.where(customer_id: customer_id)
                                  .where(tasker_id: tasker_id)
      if @conversation.present?
        @conversation.select { |conversation| @conversation_id = conversation.id  }
      else
        conversation = Conversation.create(customer_id: customer_id, 
                                            tasker_id: tasker_id)
        @conversation_id = conversation.id
      end
      
      repo = MessageRepository.new
      @message = repo.create_in_room(conversation_id: @conversation_id, text: text)
      { message: @message }
    end
  end
end
