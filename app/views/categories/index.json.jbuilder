json.array!(@categories) do |category|
  json.extract! category, :id, :nome, :descricao
  json.url category_url(category, format: :json)
end
