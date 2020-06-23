class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}
    validates :email, presence: true, uniqueness: true

    has_many :tickets, foreign_key: :user_id

end
