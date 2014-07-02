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

  def meus_cahamados
    @calls=Call.find_by(:client_id=>current_user.id)
  end

  def chamado_horas
    @calls=Call.order('h_trabalhadas DESC').limit(10)
  end
  def chamado_horas_colaborador
    @calls=Call.all
  end

  def chamado_estado
    @calls=Call.select("count(estado) as qtde, estado")
  end

  def resolver
    @call=Call.find_by(:id=>params[:id])
    @resolver=ColaboradorsCalls.new(:colaborador_id=>current_user.id,:call_id=>params[:id])
    @call.update_attributes(:colaborador_id=>current_user.colaborador.id,:estado=>"Atribuida")
    @resolver.save
    render :show
  end
  def ja_resolvi
    @call=Call.find_by(:id=>params[:id])
  end
  def resolvida_enviar
    @call=Call.find_by(:id=>params[:id])
    @call.update_attributes(:estado=>"Resolvida",:colaborador_id=>current_user.colaborador.id,:h_trabalhadas=>params[:h_trabalhadas]['h_trabalhadas(4i)']+':'+params[:h_trabalhadas]['h_trabalhadas(5i)'])
    redirect_to '/calls'
  end

  def escalonar
    @call=Call.find_by(:id=>params[:id])
    if current_user.colaborador.perfil.nome=='Tec1'
      @escalonar=@call.update_attributes(:estado=>'Pendente',:escalonado=>1)
    elsif current_user.colaborador.perfil.nome=='Tec2'
      @escalonar=@call.update_attributes(:estado=>'Pendente',:escalonado=>2)
    end
    render :show
  end
  def abandonar
    @call=Call.find_by(:id=>params[:id])
    @call.update_attributes(:estado=>'Abandonada')
    render :show
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
