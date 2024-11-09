class TaskMastersController < ApplicationController
  before_action :set_task_master, only: %i[ show edit update destroy ]

  # GET /task_masters or /task_masters.json
  def index
    @task_masters = TaskMaster.all
  end

  # GET /task_masters/1 or /task_masters/1.json
  def show
  end

  # GET /task_masters/new
  def new
    @task_master = TaskMaster.new
  end

  # GET /task_masters/1/edit
  def edit
  end

  # POST /task_masters or /task_masters.json
  def create
    @task_master = TaskMaster.new(task_master_params)

    respond_to do |format|
      if @task_master.save
        format.html { redirect_to @task_master, notice: "Task master was successfully created." }
        format.json { render :show, status: :created, location: @task_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_masters/1 or /task_masters/1.json
  def update
    respond_to do |format|
      if @task_master.update(task_master_params)
        format.html { redirect_to @task_master, notice: "Task master was successfully updated." }
        format.json { render :show, status: :ok, location: @task_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_masters/1 or /task_masters/1.json
  def destroy
    @task_master.destroy!

    respond_to do |format|
      format.html { redirect_to task_masters_path, status: :see_other, notice: "Task master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_master
      @task_master = TaskMaster.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_master_params
      params.expect(task_master: [ :task_name ])
    end
end
