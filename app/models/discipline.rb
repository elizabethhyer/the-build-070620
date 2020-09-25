class Discipline < ApplicationRecord
    has_many :projects
    validates :kind, presence: true, uniqueness: true
end
