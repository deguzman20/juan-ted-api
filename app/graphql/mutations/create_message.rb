module Mutations
  class CreateMessage < BaseMutation
    # argument :conversation_id, Integer, required: false
    argument :customer_id, Integer, required: true
    argument :tasker_id, Integer, required: true
    argument :own_by_customer, Boolean, required: true
    argument :text, String, required: true

    field :message, Types::MessageType, null: false

    def resolve(customer_id:, tasker_id:, text:, own_by_customer:)
      @convesation_id = nil
      @datetime = Time.new
      @datetime.strftime("%d-%m-%Y %k-%M-%S")

      @conversation = Conversation.where(customer_id: customer_id)
                                  .where(tasker_id: tasker_id)
      if @conversation.present?
        @conversation.select { |conversation| @conversation_id = conversation.id }
      else
        conversation = Conversation.create(customer_id: customer_id,
                                           tasker_id: tasker_id)
        @conversation_id = conversation.id
      end

      @message = Message.create(conversation_id: @conversation_id,
                                text: text, own_by_customer: own_by_customer,
                                created_date: @datetime)
      { message: @message }
    end
  end
end
