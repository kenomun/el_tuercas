class VehiculosController < ApplicationController
  before_action :set_vehiculo, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: []
  before_action only: [:new, :create] do
    authorize_request(["admin", "user"])
  end

  before_action only: [:edit, :update, :destroy] do
    authorize_request(["admin", "user"])
  end

  # GET /vehiculos or /vehiculos.json
  def index
    @vehiculos = Vehiculo.order(created_at: :desc)
  end  

  # GET /vehiculos/1 or /vehiculos/1.json
  def show
  end

  # GET /vehiculos/new
  def new
    @vehiculo = current_user.vehiculo.build
    @vehiculo = Vehiculo.new(año: Date.current.year)
  end

  # GET /vehiculos/1/edit
  def edit
  end

  # POST /vehiculos or /vehiculos.json
  def create
    @vehiculo = current_user.vehiculo.build(vehiculo_params)
    @vehiculo.user = current_user

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to vehiculo_url(@vehiculo), notice: "Vehiculo was successfully created." }
        format.json { render :show, status: :created, location: @vehiculo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehiculos/1 or /vehiculos/1.json
  def update
    respond_to do |format|
      if @vehiculo.update(vehiculo_params)
        format.html { redirect_to vehiculo_url(@vehiculo), notice: "Vehiculo was successfully updated." }
        format.json { render :show, status: :ok, location: @vehiculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1 or /vehiculos/1.json
  def destroy
    @vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to vehiculos_url, notice: "Vehiculo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiculo
      @vehiculo = Vehiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehiculo_params
      params.require(:vehiculo).permit(:marca, :modelo, :año, :patente)
    end
end
