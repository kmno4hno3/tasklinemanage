class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def edit
  end

  def new
    @task = Task.new
  end

  def create
    logger.debug("~~~~~~~~~")
    logger.debug(task_params)
    logger.debug("~~~~~~~~~")
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url
  end

  def show
  end

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end


end
