require 'vote_helper.rb'
class Comment < ActiveRecord::Base
	include VoteHelper
	belongs_to :user
	belongs_to :submission
	belongs_to :parent_comment
	has_many :votes
	has_many :comments
	
	
	validates :content, presence: true
	validates :user, presence: true
	validates :submission, presence: true	
end
