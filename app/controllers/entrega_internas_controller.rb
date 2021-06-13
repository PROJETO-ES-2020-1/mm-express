class EntregaInternasController < ApplicationController
  before_action :set_entrega_interna, only: %i[ show edit update destroy ]

  # GET /entrega_internas or /entrega_internas.json
  def index
    @entrega_internas = EntregaInterna.all
  end

  # GET /entrega_internas/1 or /entrega_internas/1.json
  def show
  end

  # GET /entrega_internas/new
  def new
    @entrega_interna = EntregaInterna.new
  end

  # GET /entrega_internas/1/edit
  def edit
  end

  # POST /entrega_internas or /entrega_internas.json
  def create
    @entrega_interna = EntregaInterna.new(entrega_interna_params)

    respond_to do |format|
      if @entrega_interna.save
        format.html { redirect_to @entrega_interna, notice: "Entrega interna was successfully created." }
        format.json { render :show, status: :created, location: @entrega_interna }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrega_interna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrega_internas/1 or /entrega_internas/1.json
  def update
    respond_to do |format|
      if @entrega_interna.update(entrega_interna_params)
        format.html { redirect_to @entrega_interna, notice: "Entrega interna was successfully updated." }
        format.json { render :show, status: :ok, location: @entrega_interna }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrega_interna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrega_internas/1 or /entrega_internas/1.json
  def destroy
    @entrega_interna.destroy
    respond_to do |format|
      format.html { redirect_to entrega_internas_url, notice: "Entrega interna was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega_interna
      @entrega_interna = EntregaInterna.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrega_interna_params
      params.require(:entrega_interna).permit(:data_entrega, :hora_recebida, :recebido_por, :entrega_externa_id)
    end
end
