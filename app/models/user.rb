class User < ApplicationRecord
    has_many :notes, dependent: :destroy
    has_many :projects, through: :notes, dependent: :destroy
    validates :email, uniqueness: {case_sensitive: false}, presence: true
    validates :username, uniqueness: true, presence: true 
    has_secure_password

    def to_s
        self.first_name + " " + self.last_name
    end

end
