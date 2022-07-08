class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[ show update destroy ]

  # GET /work_sessions
  def index
    @work_sessions = WorkSession.all

    render json: @work_sessions
  end

  # GET /work_sessions/1
  def show
    render json: @work_session
  end

  # POST /work_sessions
  def create
    @work_session = WorkSession.new(work_session_params)

    if @work_session.save
      render json: @work_session, status: :created, location: @work_session
    else
      render json: @work_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_sessions/1
  def update
    if @work_session.update(work_session_params)
      render json: @work_session
    else
      render json: @work_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_sessions/1
  def destroy
    @work_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_session
      @work_session = WorkSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_session_params
      params.require(:work_session).permit(:minutes, :task_id)
    end
end
