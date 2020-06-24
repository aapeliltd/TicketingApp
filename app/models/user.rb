class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :name, presence: true
    validates :password, presence: true
    validates :email, presence: true

    has_many :tickets, foreign_key: :user_id

end
