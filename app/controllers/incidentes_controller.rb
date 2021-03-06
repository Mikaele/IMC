class IncidentesController < ApplicationController
 before_action :set_incidente, only: [:create]

  load_and_authorize_resource

  # GET /incidentes
  # GET /incidentes.json
  def index
    @incidentes = Incidente.all
  end

  # GET /incidentes/1
  # GET /incidentes/1.json
  def show
  end

  # GET /incidentes/new
  def new
    @incidente = Incidente.new
  end

  # GET /incidentes/1/edit
  def edit
  end

  # POST /incidentes
  # POST /incidentes.json
  def create
    @incidente = Incidente.new(incidente_params)

    respond_to do |format|
      if @incidente.save
        DataFile.save(incidente_anexo,'incidentes',@incidente.id,'anexo')
        format.html { redirect_to @incidente, notice: 'Incidente was successfully created.' }
        format.json { render :show, status: :created, location: @incidente }
      else
        format.html { render :new }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentes/1
  # PATCH/PUT /incidentes/1.json
  def update
    respond_to do |format|
      if @incidente.update(incidente_params)
        format.html { redirect_to @incidente, notice: 'Incidente was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidente }
      else
        format.html { render :edit }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentes/1
  # DELETE /incidentes/1.json
  def destroy
    @incidente.destroy
    respond_to do |format|
      format.html { redirect_to incidentes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidente
      @incidente = Incidente.new(incidente_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidente_params
      params.require(:incidente).permit(:call_id, :comentario, :colaborador_id)
    end
  def incidente_anexo
      params.require(:incidente).permit(:anexo)
    end
end
