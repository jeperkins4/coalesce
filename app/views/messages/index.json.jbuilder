json.array!(@messages) do |message|
  json.extract! message, :id, :text, :provider, :nickname, :identity_id
  json.url message_url(message, format: :json)
end
