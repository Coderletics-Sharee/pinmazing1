json.array!(@comments) do |comment|
  json.extract! comment, :id, :pin_user, :body
  json.url comment_url(comment, format: :json)
end
