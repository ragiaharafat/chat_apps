class App < ApplicationRecord
    before_validation :generate_token, on: :create
    # has_secure_token
    # has_secure_token :token, length: 36

    has_many :chats, dependent: :destroy, counter_cache: true
    validates :token, presence: true, uniqueness: true
    validates :name, presence: true

    def generate_token
        self.token = loop do
        random_token = Random.urlsafe_base64(nil, false)
        break random_token unless App.exists?(token: random_token)
        end
    end


end
