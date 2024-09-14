json.extract! message, :id, :number, :chat_id, :body, :created_at, :updated_at
json.url message_url(message, format: :json)
