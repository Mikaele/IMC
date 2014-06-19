json.array!(@incidentes) do |incidente|
  json.extract! incidente, :id, :call_id, :comentario, :anexo, :colaborador_id
  json.url incidente_url(incidente, format: :json)
end
