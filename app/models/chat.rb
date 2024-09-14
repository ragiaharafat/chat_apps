class Chat < ApplicationRecord
  # Associations
  before_validation :set_chat_number, on: :create
  belongs_to :app ,counter_cache: true
  has_many :messages, dependent: :destroy
  
  # Validations
  validates :app, presence: true

  # # Methods
  def set_chat_number
    if self.app
      self.id = self.app.chats.count + 1
    end
  end
end