require "vote_helper.rb"
require "notification_helper.rb"

class Comment < ActiveRecord::Base
	include VoteHelper
	belongs_to :user
	belongs_to :submission
	belongs_to :parent_comment # this is not happening due to the ckEditor issue
	has_many :votes
	has_many :comments # this is not happening due to the ckEditor issue
	has_many :post_changes, as: :change_object, dependent: :destroy

	validates :content, presence: true
	validates :user, presence: true
	validates :submission, presence: true

	after_create :notify_users

	private

	def notify_users
		post_change = PostChange.create(
			post_change_type: "comment",
			submission: submission,
			change_object: self
		)
		NotificationHelper.notify_users(post_change)
	end
end
