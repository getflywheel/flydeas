module NotificationHelper
	def self.notify_users(post_change)
		n = Notifier.new
		n.notify_users(post_change)
	end

	# Class contains the logic and hides methods
	class Notifier
		def notify_users(post_change)
			@post_change = post_change
			make_notifications
			enqueue_emails
		end

		def make_notifications
			@post_change.submission.watchers.each do |user|
				Notification.create(user: user, post_change: @post_change)
			end
		end

		def enqueue_emails; end
	end
end
