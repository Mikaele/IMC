class TechnicsController < ApplicationController
  before_action :set_technic, only: [:show, :edit, :update, :destroy]

  # GET /technics
  # GET /technics.json
  def index
    @technics = Technic.all
  end

  # GET /technics/1
  # GET /technics/1.json
  def show
  end

  # GET /technics/new
  def new
    @technic = Technic.new
  end

  # GET /technics/1/edit
  def edit
  end

  # POST /technics
  # POST /technics.json
  def create
    @technic = Technic.new(technic_params)

    respond_to do |format|
      if @technic.save
        format.html { redirect_to @technic, notice: 'Technic was successfully created.' }
        format.json { render :show, status: :created, location: @technic }
      else
        format.html { render :new }
        format.json { render json: @technic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technics/1
  # PATCH/PUT /technics/1.json
  def update
    respond_to do |format|
      if @technic.update(technic_params)
        format.html { redirect_to @technic, notice: 'Technic was successfully updated.' }
        format.json { render :show, status: :ok, location: @technic }
      else
        format.html { render :edit }
        format.json { render json: @technic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technics/1
  # DELETE /technics/1.json
  def destroy
    @technic.destroy
    respond_to do |format|
      format.html { redirect_to technics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technic
      @technic = Technic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technic_params
      params.require(:technic).permit(:user_id, :level,:cpf, :telefone, :endereco)
    end
end
