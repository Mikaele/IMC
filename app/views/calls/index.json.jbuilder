json.array!(@calls) do |call|
  json.extract! call, :id, :technic_id, :client_id, :number, :state, :time_worked
  json.url call_url(call, format: :json)
end
