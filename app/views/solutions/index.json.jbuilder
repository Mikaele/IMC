json.array!(@solutions) do |solution|
  json.extract! solution, :id, :call_id, :comentario, :anexo, :colaborador_id
  json.url solution_url(solution, format: :json)
end
