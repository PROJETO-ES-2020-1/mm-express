class SobreavisoDeEntregasController < ApplicationController
  before_action :set_sobreaviso_de_entrega, only: %i[ show edit update destroy ]
  before_action :authorize

  # GET /sobreaviso_de_entregas or /sobreaviso_de_entregas.json
  def index
    if !current_user_morador?()
      @sobreaviso_de_entregas = SobreavisoDeEntrega.all
    else
      @sobreaviso_de_entregas = SobreavisoDeEntrega.where("usuario_id = ?", current_user)
    end
  end

  # GET /sobreaviso_de_entregas/1 or /sobreaviso_de_entregas/1.json
  def show
  end

  # GET /sobreaviso_de_entregas/new
  def new
    @sobreaviso_de_entrega = SobreavisoDeEntrega.new
  end

  # GET /sobreaviso_de_entregas/1/edit
  def edit
  end

  # POST /sobreaviso_de_entregas or /sobreaviso_de_entregas.json
  def create
    @sobreaviso_de_entrega = SobreavisoDeEntrega.new(sobreaviso_de_entrega_params)
    @sobreaviso_de_entrega.set_user!(current_user)

    respond_to do |format|
      if @sobreaviso_de_entrega.save
        format.html { redirect_to @sobreaviso_de_entrega, notice: "Sobreaviso de entrega was successfully created." }
        format.json { render :show, status: :created, location: @sobreaviso_de_entrega }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sobreaviso_de_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sobreaviso_de_entregas/1 or /sobreaviso_de_entregas/1.json
  def update
    respond_to do |format|
      if @sobreaviso_de_entrega.update(sobreaviso_de_entrega_params)
        format.html { redirect_to @sobreaviso_de_entrega, notice: "Sobreaviso de entrega was successfully updated." }
        format.json { render :show, status: :ok, location: @sobreaviso_de_entrega }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sobreaviso_de_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sobreaviso_de_entregas/1 or /sobreaviso_de_entregas/1.json
  def destroy
    @sobreaviso_de_entrega.destroy
    respond_to do |format|
      format.html { redirect_to sobreaviso_de_entregas_url, notice: "Sobreaviso de entrega was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sobreaviso_de_entrega
    @sobreaviso_de_entrega = current_user.sobreaviso_de_entregas.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sobreaviso_de_entrega_params
    params.require(:sobreaviso_de_entrega).permit(:data_prevista_entrega, :urgencia_de_repasse)
  end
end
