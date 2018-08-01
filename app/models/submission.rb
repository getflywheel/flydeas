require "vote_helper.rb"
require "notification_helper.rb"

class Submission < ActiveRecord::Base
	include VoteHelper
	belongs_to :user
	belongs_to :category
	belongs_to :status
	has_many :votes
	has_many :comments
	has_many :post_changes
	has_and_belongs_to_many :watchers, class_name: "User", join_table: :watches

	validates :category_id, presence: true
	validates :user_id, presence: true
	validates :content, presence: true

	after_save :notify_users

	private

	def notify_users
		if vote_count_changed?
			post_change = PostChange.create(submission: self, post_change_type: "vote")
			NotificationHelper.notify_users(post_change)
		end

		return unless status_id_changed?
		post_change = PostChange.create(
			submission: self, post_change_type: "status",
			change_object: status
		)
		NotificationHelper.notify_users(post_change)
	end
end
