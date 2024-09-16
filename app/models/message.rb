class Message < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  # include Searchable
  belongs_to :chat, counter_cache: true

  # Validations
  validates :body, presence: true
  #validates :number, presence: true, uniqueness: { scope: :chat_id }
    
  
  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       query: {
  #         multi_match: {
  #           query: query,
  #           fields: ['body']
  #           }
  #         }
  #       }
  #     ).records
  #   end
end
