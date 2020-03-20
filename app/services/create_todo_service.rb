class CreateTodoService < ApplicationService
  attr_accessor :todo_description, :current_customer

  def initialize(todo_description = nil, current_customer = nil)
    @todo_description = todo_description
    @current_customer = current_customer
  end

  def call
    create_todo
  end

    private

      def create_todo
        @keyword = nil

        @result = Keyword.where('keyword IN (?)', "#{todo_description}")

        return unless @result.present?

        todo = Todo.new(todo_description: todo_description,
                  customer_id: current_customer,
                  service_id: @result.each { |r| r.service })

        if todo.save
          "Todo created"
        else
          "Failed to create todo"
        end
      end
end
