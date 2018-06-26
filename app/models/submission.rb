class Submission < ActiveRecord::Base
    belongs_to :user
<<<<<<< HEAD
    belongs_to :category
    has_many :votes
    
    validates :category_id,  presence: true
||||||| merged common ancestors
    #has_many :votes
    validates :category,  presence: true
=======
    has_many :votes
    validates :category,  presence: true
>>>>>>> Vote model complete, inital dashboard stuff
    validates :user_id, presence: true
    validates :content, presence: true
end
