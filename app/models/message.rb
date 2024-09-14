class Message < ApplicationRecord
  include Searchable
  belongs_to :chat, counter_cache: true

  # Validations
  validates :body, presence: true
  #validates :number, presence: true, uniqueness: { scope: :chat_id }
 

end
