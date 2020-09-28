class Project < ApplicationRecord
    belongs_to :discipline 
    has_many :notes
    has_many :users, through: :notes
    validates :name, presence: true
    validates :technique_used, presence:true 
end
