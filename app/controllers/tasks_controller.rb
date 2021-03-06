class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy move ]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.order(created_at: :asc)
    @task = current_user.tasks.new
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    render
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    render
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated." }
        format.json { render json: @task, message: "Success" , status: 200 }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    end
  end

  def move
    @task.insert_at(params[:position].to_i)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:user, :title, :description, :completed, :due_date)
    end
end
