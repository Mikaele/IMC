json.array!(@calls) do |call|
  json.extract! call, :id, :description, :service_id, :files, :client_id, :h_trabalhadas, :colaborador_id, :estado
  json.url call_url(call, format: :json)
end
