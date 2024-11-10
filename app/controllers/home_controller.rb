class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def new
    @task = Task.new
  end

  def create
    task_name = params[:task_name]
    id = TaskMaster.where(task_name: task_name).first&.id
    if id.nil?
      redirect_to home_path, notice: 'タスクがマスターに登録されていません'
    end

    @task = Task.new(
      task_master_id: id, 
      user_id: current_user.id,
      start_time: Time.now
    )

    if @task.save
      redirect_to root_path
    else
      render :index
    end
  end

  def index
    return if current_user.nil?

    @tasks = Task.where(user_id: current_user.id).order(id: :desc).limit(10).all
  end

  private

    def task_params
      params.expect([ :task_name ])
    end

end
