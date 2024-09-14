class Chat < ApplicationRecord
  # Associations
  before_validation :set_chat_number, on: :create
  belongs_to :app
  has_many :messages, dependent: :destroy
  
  # Validations
  # validates :chat_id, presence: true
  validates :app, presence: true
  # # before_validation :set_chat_number, on: :create
  # # validates :app, presence: true
  # # validates :messages_count, numericality: { greater_than_or_equal_to: 0 }
  # # validate :number_uniqueness_within_application


  # def number_uniqueness_within_application
  #   if Chat.where(app_id: app_id, number: number).exists?
  #     errors.add(:number, "must be unique within the same application")
  #     log_error("Chat number #{number} already exists for application #{app_id}")
  #   end
  # end

  # # Methods
  def set_chat_number
    if self.app
      self.id = self.app.chats.count + 1
    end
  end
end