json.array!(@colaboradors) do |colaborador|
  json.extract! colaborador, :id, :user_id, :cpf, :telefone, :endereco
  json.url colaborador_url(colaborador, format: :json)
end
