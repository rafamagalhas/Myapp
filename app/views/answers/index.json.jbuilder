json.array!(@answers) do |answer|
  json.extract! answer, :id, :content
  json.url answer_url(answer, format: :json)
end
