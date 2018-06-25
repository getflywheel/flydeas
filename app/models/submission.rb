class Submission < ActiveRecord::Base
    belongs_to :user
    #has_many :votes
    validates :category,  presence: true
    validates :user_id, presence: true
    validates :content, presence: true
end
