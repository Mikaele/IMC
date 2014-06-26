class CallsController < ApplicationController
  before_action :set_call, only: [:create]

  load_and_authorize_resource

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call=Call.find_by(:id=>params[:id])
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)
      respond_to do |format|
      if @call.save
        DataFile.save(call_file,'calls',@call.id,'files')

        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end

  def chamado_horas
    @calls=Call.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.new(call_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:description,:service_id, :client_id, :h_trabalhadas, :escalonado,:colaborador_id, :estado,:service_ids=>[])
    end
  def call_file
      params.require(:call).permit(:files)
    end
end
