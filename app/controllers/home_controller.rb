class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def create
    task_name = params[:task_name]
    id = TaskMaster.where(task_name: task_name).first&.id
    if id.nil?
      redirect_to home_index_path, notice: 'タスクがマスターに登録されていません'
      return
    end

    @task = Task.new(
      task_master_id: id, 
      user_id: current_user.id,
      start_time: Time.now
    )

    if @task.save
      redirect_to home_index_path
    else
      render :index
    end
  end

  def index
    return if current_user.nil?

    @tasks = Task.where(user_id: current_user.id).order(id: :desc).limit(10).all
    @task_masters = TaskMaster.all.sort
  end

  def update
    pparams = params.permit([:id, :action_type])
    task = Task.find(pparams[:id])
    if task.nil?
      render status: :not_found
      return
    end
    if task&.user&.id != current_user.id
      render status: :forbidden
      return
    end

    task.end_time = Time.now
    task.save

    redirect_to home_index_path
 
  end
  private

    def task_params
      params.expect([ :task_name ])
    end

end
