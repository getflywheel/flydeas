# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	# Preview this email at http://localhost:3000/rails/mailers/user_mailer/accout_activation
	def account_activation
		@u = User.find_by(username: "emailactivationtest")
		create_user("emailactivationtest") if @u.nil?
		@u.create_activation_digest
		@u.save
		UserMailer.account_activation(@u)
	end

	# Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
	def password_reset
		user = User.first
		user.reset_token = user.new_token
		UserMailer.password_reset(user)
	end

	def notifications
		@u = User.find_by(username: "emailtestuser")
		@s = Submission.find_by(title: "test submission for email")
		create_user("emailtestuser") if @u.nil?
		create_submission if @s.nil?
		make_changes unless @u.notifications.any?
		UserMailer.notifications(@u)
	end

	private

	def make_changes
		@s.vote_count = 2
		@s.save
		Comment.create(submission_id: @s.id, content: "stuffs", user: @u)
	end

	def create_user(username)
		@u = User.new(
			username: username,
			email: "emailtestuser@getflywheel.com",
			password: "Flywheel1!",
			activated: true
		)
		@u.encrypt_password
		@u.save
	end

	def create_submission
		@s = Submission.new(
			title: "test submission for email",
			content: "nothing important",
			user: @u,
			category: Category.first,
			status: Status.first
		)
		@s.watchers << @u
		@s.save
	end
end
