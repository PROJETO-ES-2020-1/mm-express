class SolicitacaoRepassesController < ApplicationController
  before_action :set_solicitacao_repasse, only: %i[ show edit update destroy ]
  before_action :authorize

  # GET /solicitacao_repasses or /solicitacao_repasses.json
  def index
    @solicitacao_repasses = SolicitacaoRepasse.all
    @solicitacoes = []
    @solicitacao_repasses.each { |solicitacao|
      @encomenda = Encomenda.find(params[:id], solicitacao.entrega_externa_id)
      if @encomenda.usuario.id == @current_user.id
        @solicitacoes.push(solicitacao)
      end
    }
    @solicitacao_repasses = @solicitacoes
  end

  # GET /solicitacao_repasses/1 or /solicitacao_repasses/1.json
  def show
  end

  # GET /solicitacao_repasses/new
  def new
    @solicitacao_repass = SolicitacaoRepasse.new
    @entregas_externas = EntregaExterna.all
    @entregas_externas_usuario = []
    @entregas_externas.each { |entrega|
      if entrega.encomenda.usuario.id == @current_user.id
        @entregas_externas_usuario.push(entrega)
      end
    }
  end

  # GET /solicitacao_repasses/1/edit
  def edit
  end

  # POST /solicitacao_repasses or /solicitacao_repasses.json
  def create
    @solicitacao_repass = SolicitacaoRepasse.new(solicitacao_repasse_params)

    respond_to do |format|
      if @solicitacao_repass.save
        format.html { redirect_to @solicitacao_repass, notice: "Solicitacao repasse was successfully created." }
        format.json { render :show, status: :created, location: @solicitacao_repass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solicitacao_repass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitacao_repasses/1 or /solicitacao_repasses/1.json
  def update
    respond_to do |format|
      if @solicitacao_repass.update(solicitacao_repasse_params)
        format.html { redirect_to @solicitacao_repass, notice: "Solicitacao repasse was successfully updated." }
        format.json { render :show, status: :ok, location: @solicitacao_repass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solicitacao_repass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitacao_repasses/1 or /solicitacao_repasses/1.json
  def destroy
    @solicitacao_repass.destroy
    respond_to do |format|
      format.html { redirect_to solicitacao_repasses_url, notice: "Solicitacao repasse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitacao_repasse
    @solicitacao_repass = SolicitacaoRepasse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def solicitacao_repasse_params
    params.require(:solicitacao_repasse).permit(:dataSolicitada, :entrega_externa_id)
  end
end
