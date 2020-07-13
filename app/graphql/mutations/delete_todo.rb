module Mutations
  # mutation for creating todo
  class DeleteTodo < BaseMutation
    description "Delete Task Todo list"
    field :response, String, null: true
    argument :todo_id, Integer, required: true
    type Types::TodoType

    def resolve(** args)
      # if context[:current_customer].present?
      todo = DeleteTodoService.call(args[:todo_id])

      { response: todo }
      # else
      #   { response: "Unauthorized" }
      # end
    end
  end
end
