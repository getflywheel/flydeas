require 'vote_helper.rb'
class Submission < ActiveRecord::Base
	include VoteHelper
	belongs_to :user
	belongs_to :category
        belongs_to :status
	has_many :votes
	has_many :comments

	validates :category_id,  presence: true
	validates :user_id, presence: true
	validates :content, presence: true
end
