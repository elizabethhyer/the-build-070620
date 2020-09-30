class Note < ApplicationRecord
    belongs_to :user
    belongs_to :project
    validates :title, presence: true
end
