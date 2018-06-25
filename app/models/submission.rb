class Submission < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :votes
    
    validates :category_id,  presence: true
    validates :user_id, presence: true
    validates :content, presence: true
end
