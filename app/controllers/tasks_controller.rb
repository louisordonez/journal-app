require 'date'

class TasksController < ApplicationController
  def index
    @filter = params[:filter]

    case @filter
    when 'today'
      @task = Task.where(category_id: params[:category_id], deadline: Date.today)
    when 'overdue'
      @task = Task.where(category_id: params[:category_id]).where('deadline < ?', Date.today)
    else
      @task = Task.where(category_id: params[:category_id])
    end
  end

  def show
    @task = Task.where(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)

    if @task.save
      redirect_to category_tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to category_tasks_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to category_tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
