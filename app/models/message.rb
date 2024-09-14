class Message < ApplicationRecord
  belongs_to :chat

  # Validations
  validates :body, presence: true
  #validates :number, presence: true, uniqueness: { scope: :chat_id }
 

end
