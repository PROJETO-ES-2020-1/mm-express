module SessionsHelper
  def sign_in(usuario)
    session[:usuario_id] = usuario.id
  end

  def current_user
    @current_user ||= Usuario.find_by(id: session[:usuario_id])
  end

  def current_user_morador?
    current_user.isMorador
  end

  def block_access
    if current_user.present?
      redirect_to encomendas_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:usuario_id)
    @current_user = nil
  end
end
