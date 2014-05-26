json.array!(@ics) do |ic|
  json.extract! ic, :id, :name, :number, :description
  json.url ic_url(ic, format: :json)
end
