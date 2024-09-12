class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy

  validates :message_id, presence: true, uniqueness: { scope: :application_id }
end
