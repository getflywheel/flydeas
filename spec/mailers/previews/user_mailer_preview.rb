# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	# Preview this email at http://localhost:3000/rails/mailers/user_mailer/accout_activation
	def account_activation
		UserMailer.account_activation
	end

	# Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
	def password_reset
		user = User.first
		puts "---------------"
		puts user.username
		user.reset_token = user.new_token
		UserMailer.password_reset(user)
	end

	def notifications
		user = User.find_by(username: "emailtestuser")
		create_email_preview_data if user.nil? 
		UserMailer.notifications(user)
	end	

	private

	def create_email_preview_data
		u = User.new(
			username: "emailtestuser",
			email: "emailtestuser@getflywheel.com",
			password: "Flywheel1!",
			activated: true
		)
		u.encrypt_password
		u.save
		s = Submission.new(
			title: "test submission for email",
			content: "nothing important",
			user: u, 
			category: Category.first,
			status: Status.first
		)
		s.watchers << u
		u.save
		s.save
		s.status = Status.second
		s.vote_count = 2
		s.save
		c = Comment.create(submission_id: s.id, content: "stuffs", user: u)
		return u
	end
end
