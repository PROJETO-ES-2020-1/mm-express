json.extract! usuario, :id, :nome, :email, :telefone, :cpf, :numero_residencia, :bloco_residencia, :isMorador, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
