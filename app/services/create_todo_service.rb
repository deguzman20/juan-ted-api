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

        todo_description.split(/\W+/) do |keyword|
          keyword.each do |kword|
            @keyword = kword
          end

          @result = Keyword.find_by_keyword('keyword ILIKE ?', "%#{@keyword}%")

          return unless @result.present?

          todo = Todo.new(todo_description: todo_description,
                    customer_id: current_customer,
                    service_id: @result.service_id)

          if todo.save
            "Todo created"
          else
            "Failed to create todo"
          end

        end
      end
end
