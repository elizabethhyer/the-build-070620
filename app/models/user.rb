class User < ApplicationRecord
    has_many :notes 
    has_many :projects, through: :notes
    validates :email, uniqueness: {case_sensitive: false}, presence: true
    validates :username, uniqueness: true, presence: true 
    has_secure_password
end
