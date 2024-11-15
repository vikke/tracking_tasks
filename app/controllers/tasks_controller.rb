class TasksController < ApplicationController
  before_action :set_task_master, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all.sort
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    redirect_to @task, notice: "Task was successfully created."
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to task_path, status: :see_other, notice: "Task was successfully destroyed."
  end

  private
    def set_task
      @task = Task.find(params.expect(:id))
    end

    def task_params
      params.expect(task: [ :task_name ])
    end
end
