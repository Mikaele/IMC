json.array!(@services) do |service|
  json.extract! service, :id, :name, :number, :category, :description, :ic_id
  json.url service_url(service, format: :json)
end
