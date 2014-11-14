json.array!(@file_messages) do |file_message|
  json.extract! file_message, :id, :sender_id, :recipient_id, :name, :link, :bytes, :icon, :thumbnailLink, :created_at, :new
  json.url file_message_url(file_message, format: :json)
end
