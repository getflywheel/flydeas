module NotificationHelper
	# Email worker queue
	@queue = :emails

	# Create notifications for watchers and enqueue emails
	def self.notify_users(post_change)
		n = Notifier.new
		n.notify_users(post_change)
	end

	# Called by resque when task runs
	def self.perform(user_id)
		user = User.find(user_id)
		UserMailer.notifications(user).deliver_now
		user.notifications.destroy_all
		user.save
	end

	# Class hides logic that should be inaccessible to other classes
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

		def enqueue_emails
			send_immediately = @post_change.post_change_type == "status"
			@post_change.submission.watchers.each do |user|
				Resque.remove_delayed(NotificationHelper, user_id: user.id)
				if send_immediately
					Resque.enqueue(NotificationHelper, user.id)
				else
					Resque.enqueue_at(send_time, NotificationHelper, user.id)
				end
			end
		end

		def send_time
			@send_time unless @send_time.nil?
			# Scheduled time is 3 pm central and 8 pm utc
			scheduled_time = 20
			time = Time.zone.now
			@send_time =
				if time.hour > scheduled_time
					time.midnight.change(hour: scheduled_time) + 1.day
				else
					time.midnight.change(hour: scheduled_time)
				end
			@send_time
		end
	end
end
