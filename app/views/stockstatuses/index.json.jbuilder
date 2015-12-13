json.array!(@stockstatuses) do |stockstatus|
  json.extract! stockstatus, :id, :stuff
  json.url stockstatus_url(stockstatus, format: :json)
end
