class TaskLabelsController < ApplicationController
  before_action :set_task_label, only: %i[ show update destroy ]

  # GET /task_labels
  def index
    @task_labels = TaskLabel.all

    render json: @task_labels
  end

  # GET /task_labels/1
  def show
    render json: @task_label
  end

  # POST /task_labels
  def create
    @task_label = TaskLabel.new(task_label_params)

    if @task_label.save
      render json: @task_label, status: :created, location: @task_label
    else
      render json: @task_label.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_labels/1
  def update
    if @task_label.update(task_label_params)
      render json: @task_label
    else
      render json: @task_label.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_labels/1
  def destroy
    @task_label.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_label
      @task_label = TaskLabel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_label_params
      params.fetch(:task_label, {})
    end
end
