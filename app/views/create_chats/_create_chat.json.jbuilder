json.extract! create_chat, :id, :number, :application_id, :messages_count, :created_at, :updated_at
json.url create_chat_url(create_chat, format: :json)
