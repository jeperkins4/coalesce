json.array!(@messages) do |message|
  json.extract! message, :id, :posted_text, :provider, :nickname, :identity_id, :project_id, :posted_at
  json.url message_url(message, format: :json)
end
