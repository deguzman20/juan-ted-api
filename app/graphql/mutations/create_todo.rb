module Mutations
  # mutation for creating todo
  class CreateTodo < BaseMutation
    description "Create Task Todo list"
    field :response, String, null: true
    argument :customer_id, Integer, required: true
    argument :todo_description, String, required: true
    type Types::TodoType

    def resolve(** args)
      CreateTodoService.call(args[:todo_description], args[:customer_id])
    end
  end
end
