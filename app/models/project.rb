class Project < ApplicationRecord
    belongs_to :discipline 
    has_many :notes
    has_many :users, through: :notes
    validates :name, presence: true, uniqueness: true
    validates :technique_used, presence:true 
    accepts_nested_attributes_for :notes

end
