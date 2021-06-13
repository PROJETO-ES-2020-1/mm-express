class EntregaExternasController < ApplicationController
  before_action :set_entrega_externa, only: %i[ show edit update destroy ]

  # GET /entrega_externas or /entrega_externas.json
  def index
    @entrega_externas = EntregaExterna.all
  end

  # GET /entrega_externas/1 or /entrega_externas/1.json
  def show
  end

  # GET /entrega_externas/new
  def new
    @entrega_externa = EntregaExterna.new
    @entrega_externa.build_encomenda
  end

  # GET /entrega_externas/1/edit
  def edit
  end

  # POST /entrega_externas or /entrega_externas.json
  def create
    @entrega_externa = EntregaExterna.new(entrega_externa_params)

    respond_to do |format|
      if @entrega_externa.save
        format.html { redirect_to @entrega_externa, notice: "Entrega externa was successfully created." }
        format.json { render :show, status: :created, location: @entrega_externa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrega_externa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrega_externas/1 or /entrega_externas/1.json
  def update
    respond_to do |format|
      if @entrega_externa.update(entrega_externa_params)
        format.html { redirect_to @entrega_externa, notice: "Entrega externa was successfully updated." }
        format.json { render :show, status: :ok, location: @entrega_externa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrega_externa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrega_externas/1 or /entrega_externas/1.json
  def destroy
    @entrega_externa.destroy
    respond_to do |format|
      format.html { redirect_to entrega_externas_url, notice: "Entrega externa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega_externa
      @entrega_externa = EntregaExterna.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrega_externa_params
      params.require(:entrega_externa).permit(:dataChegada, :horaChegada, :recebidoPor, encomenda_attributes: [:peso, :remetente, :usuario_id])
    end
  
end
