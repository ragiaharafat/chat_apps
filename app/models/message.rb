class Message < ApplicationRecord
  belongs_to :chat,index: { unique: true }

  # Validations
  validates :body, presence: true
  validates :number, presence: true, uniqueness: { scope: :chat_id }
 

end
