class SolicitudesController < ApplicationController
  before_action :set_solicitude, only: %i[ show edit update destroy ]

  # GET /solicitudes or /solicitudes.json
  def index
    @solicitudes = Solicitude.all
  end

  # GET /solicitudes/1 or /solicitudes/1.json
  def show
  end

  # GET /solicitudes/new
  def new
    @solicitude = Solicitude.new
  end

  # GET /solicitudes/1/edit
  def edit
  end

  # POST /solicitudes or /solicitudes.json
  def create
    @solicitude = Solicitude.new(solicitude_params)

    respond_to do |format|
      if @solicitude.save
        format.html { redirect_to solicitude_url(@solicitude), notice: "Solicitude was successfully created." }
        format.json { render :show, status: :created, location: @solicitude }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solicitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitudes/1 or /solicitudes/1.json
  def update
    respond_to do |format|
      if @solicitude.update(solicitude_params)
        format.html { redirect_to solicitude_url(@solicitude), notice: "Solicitude was successfully updated." }
        format.json { render :show, status: :ok, location: @solicitude }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solicitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitudes/1 or /solicitudes/1.json
  def destroy
    @solicitude.destroy

    respond_to do |format|
      format.html { redirect_to solicitudes_url, notice: "Solicitude was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitude
      @solicitude = Solicitude.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solicitude_params
      params.require(:solicitude).permit(:codigo, :fecha_inicio, :fecha_termino, :estado, :user_id, :vehiculo_id, :servicio_id)
    end
end
