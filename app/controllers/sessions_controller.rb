class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def create
    @usuario = Usuario.find_by(email: params[:session][:email])
    if @usuario && @usuario.authenticate(params[:session][:password])
      sign_in(@usuario)
      redirect_to encomendas_path
    else
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
