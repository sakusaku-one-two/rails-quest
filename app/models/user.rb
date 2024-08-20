class User < ApplicationRecord
    validates :email,presence: true,uniqueness: true,format:{with: URI::MailTo::EMAIL_REGEXP}
    validates :password,presence: true,length: {minimum:6}
    has_secure_password
    has_many :articles, foreign_key: 'user_id'

   
end
