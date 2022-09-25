class TasksController < ApplicationController
  def index
    @task = Task.where(category_id: params[:category_id].to_i)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)
    @task.save

    redirect_to category_tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to category_tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to category_tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :deadline)
    end

end
