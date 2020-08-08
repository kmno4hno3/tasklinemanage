class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :destroy]

  def index
    @tasks = Task.all
  end

  def edit
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク#{@task.name}を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end


end
