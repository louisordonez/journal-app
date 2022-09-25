class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    # @category = Category.find(params[:id])
    # @task = @category.task.create(task_params)
    # @task.save
    # Category.find(params[:id]).task.create(task_params)

    # redirect_to "/categories/#{params[:id]}/tasks"
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
