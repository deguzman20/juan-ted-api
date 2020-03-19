module Mutations
  # mutation for creating todo
  class CreateTodo < BaseMutation
    description "Create Task Todo list"
    field :response, String, null: true
    argument :todo_description, String, required: true

    def resolve(** args)
      if context[:current_customer].present?
        response = CreateTodoService.call(args[:todo_description], context[:current_customer])
        { response: response }
      else
        { response: "Unauthorized" }
      end
    end
  end
end
