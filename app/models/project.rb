class Project < ApplicationRecord
    belongs_to :discipline 
    has_many :notes
    has_many :users, through: :notes
    validates :technique_used, presence:true 
end
