json.array!(@technics) do |technic|
  json.extract! technic, :id, :user_id, :level
  json.url technic_url(technic, format: :json)
end
