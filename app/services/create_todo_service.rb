class CreateTodoService < ApplicationService
  attr_accessor :todo_description, :customer_id

  def initialize(todo_description = nil, customer_id = nil)
    @todo_description = todo_description
    @customer_id = customer_id
  end

  def call
    create_todo
  end

    private

      def create_todo
        @keyword = nil
        @service_id = nil
        
        @result = Keyword.where('keyword IN (?)', todo_description.split(/\W+/))

        return unless @result.present?
        @result.each { |r| @service_id = r.service_id }
        
        @todo = Todo.new(todo_description: todo_description,
                  customer_id: customer_id,
                  service_id: @service_id)

        if @todo.save
           @todo 
        else
          "Failed to create todo"
        end
      end
end
