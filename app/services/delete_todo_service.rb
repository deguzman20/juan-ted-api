class DeleteTodoService < ApplicationService
  attr_accessor :todo_id

  def initialize(todo_id = nil)
    @todo_id = todo_id
  end

  def call
    delete_todo
  end

  private

    def delete_todo
      todo = Todo.find(@todo_id)
      return unless todo.present?

      if todo.delete
        "Todo was deleted"
      else
        "Failed to delete todo"
      end
    end
end
