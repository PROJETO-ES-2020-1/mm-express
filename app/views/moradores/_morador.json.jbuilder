json.extract! morador, :id, :nome, :email, :telefone, :cpf, :numero_residencia, :bloco, :created_at, :updated_at
json.url morador_url(morador, format: :json)
