class SolicitudesController < ApplicationController
  before_action :set_solicitude, only: %i[ show edit update destroy ]

  # GET /solicitudes or /solicitudes.json
  def index
    def index
      @solicitudes = Solicitude.includes(:user, :vehiculo).all
    end
    
  end

  # GET /solicitudes/1 or /solicitudes/1.json
  def show
  end

  # GET /solicitudes/new
  def new
    @solicitude = Solicitude.new
    @solicitude.generate_random_code
    @solicitude.fecha_inicio = Date.current
  end

  # GET /solicitudes/1/edit
  def edit
  end

  # POST /solicitudes or /solicitudes.json
  def create
    servicios_ids = params[:solicitude].delete(:servicios_ids)
  
    respond_to do |format|
      # ...
      solicitudes_creadas = []
      servicios_ids.each do |servicio_id|
        solicitude_params = params.require(:solicitude).permit(:fecha_inicio, :estado, :vehiculo_id).merge(servicio_id: servicio_id)
        @solicitude = Solicitude.new(solicitude_params)
        @solicitude.user = current_user
  
        if @solicitude.save
          solicitudes_creadas << @solicitude
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @solicitude.errors, status: :unprocessable_entity }
          return
        end
      end
  
      if solicitudes_creadas.any?
        format.html { redirect_to solicitudes_path, notice: "Se crearon solicitudes con exito." }
      else
        format.html { redirect_to solicitudes_path, notice: "No se crearon solicitudes." }
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
      params.require(:solicitude).permit(:fecha_inicio, :estado, :vehiculo_id, servicios_ids: [])
    end
end
