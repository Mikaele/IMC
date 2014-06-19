json.array!(@perfils) do |perfil|
  json.extract! perfil, :id, :nome, :descricao
  json.url perfil_url(perfil, format: :json)
end
