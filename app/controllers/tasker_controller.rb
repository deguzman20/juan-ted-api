# TaskerController Documetation
#   Available Action
#     - new = create tasker instance
#     - create = create new tasker
class TaskerController < ApplicationController
  def new
    @tasker = Tasker.new
  end

  def create
    @tasker = TaskerForm.new(params)
    render json: "Your inquiry was send successfuly".to_json if @tasker.save
  end
end
