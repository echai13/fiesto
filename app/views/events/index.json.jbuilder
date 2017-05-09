json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :time, :location
  json.url event_url(event, format: :json)
end
