class TasksController < ApplicationController
  before_action :prepare_data

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  def task_params
    params.require(:task).permit(:title, :detail)
  end

  def prepare_data
    @task = Task.find(params[:id]) if (params[:id] != nil)
  end

end
