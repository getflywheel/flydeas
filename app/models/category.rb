class Category < ActiveRecord::Base
    has_many :submissions
    validates :name, :presence => true 
end
