class IcsController < ApplicationController
  before_action :set_ic, only: [:show, :edit, :update, :destroy]

  # GET /ics
  # GET /ics.json
  def index
    @ics = Ic.all
  end

  # GET /ics/1
  # GET /ics/1.json
  def show
  end

  # GET /ics/new
  def new
    @ic = Ic.new
  end

  # GET /ics/1/edit
  def edit
  end

  # POST /ics
  # POST /ics.json
  def create
    @ic = Ic.new(ic_params)

    respond_to do |format|
      if @ic.save
        format.html { redirect_to @ic, notice: 'Ic was successfully created.' }
        format.json { render :show, status: :created, location: @ic }
      else
        format.html { render :new }
        format.json { render json: @ic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ics/1
  # PATCH/PUT /ics/1.json
  def update
    respond_to do |format|
      if @ic.update(ic_params)
        format.html { redirect_to @ic, notice: 'Ic was successfully updated.' }
        format.json { render :show, status: :ok, location: @ic }
      else
        format.html { render :edit }
        format.json { render json: @ic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ics/1
  # DELETE /ics/1.json
  def destroy
    @ic.destroy
    respond_to do |format|
      format.html { redirect_to ics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ic
      @ic = Ic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ic_params
      params.require(:ic).permit(:name, :number, :description)
    end
end
