class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  def create
    task_name = params[:task_name]
    id = Task.where(task_name: task_name).first&.id
    if id.nil?
      redirect_to home_index_path, notice: 'タスクがリストに登録されていません'
      return
    end

    @task = TaskRecord.new(
      task_id: id, 
      user_id: current_user.id,
      start_time: Time.current
    )

    if @task.save
      redirect_to home_index_path
    else
      render :index
    end
  end

  def index
    return if current_user.nil?

    @task_records = TaskRecord.where(user_id: current_user.id).order(id: :desc).limit(10).all
    @tasks = Task.all.sort
  end

  def update
    pparams = params.permit([:id, :action_type])
    task_record = TaskRecord.find(pparams[:id])
    if task_record.nil?
      render status: :not_found
      return
    end
    if task_record&.user_id != current_user.id
      render status: :forbidden
      return
    end

    task_record.end_time = Time.current
    task_record.save

    redirect_to home_index_path
 
  end
  private

    def task_params
      params.expect([ :task_name ])
    end

end
