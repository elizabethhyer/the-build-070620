class Project < ApplicationRecord
    belongs_to :discipline 
    has_many :notes
    has_many :users, through: :notes
    validates :name, presence: true, uniqueness: true
    validates :technique_used, presence:true 
    accepts_nested_attributes_for :notes

    def self.search(query)
        if query.present?
          where('NAME like ?', "%#{query}%")
        else
          self.all
        end
    end

    def self.desc_projects
        order('created_at' desc)
    end 

    def self.asc_projects
        order('created_at' asc)
    end 

end
