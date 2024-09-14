class App < ApplicationRecord
    has_many :chats, dependent: :destroy, counter_cache: true
    validates :token, presence: true, uniqueness: true
    validates :name, presence: true

    before_validation :generate_token, on: :create

    protected

    def generate_token
        self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        puts "Random Token:", random_token
        break random_token unless App.exists?(token: random_token)
        end
    end


end
