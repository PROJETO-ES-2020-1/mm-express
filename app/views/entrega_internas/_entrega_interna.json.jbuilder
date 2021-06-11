json.extract! entrega_interna, :id, :data_entrega, :hora_recebida, :recebido_por, :created_at, :updated_at
json.url entrega_interna_url(entrega_interna, format: :json)
