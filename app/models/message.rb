class Message < ApplicationRecord
  belongs_to :chat
  validates :message_id, presence: true, uniqueness: { scope: :chat_id }
end
