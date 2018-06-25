class Submission < ActiveRecord::Base
    belongs_to :user
    validates :category,  presence: true
    validates :user_id, presence: true
    validates :content, presence: true
end
