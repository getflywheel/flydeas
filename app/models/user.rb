class User < ActiveRecord::Base
	has_many :submissions
	has_many :votes
	USERNAME_REGEX = /[a-zA-Z0-9\-_]{0,20}/
	EMAIL_REGEX = /[a-zA-Z_0-9.-]+@getflywheel.com/i
	PASSWORD_REGEX = /.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^+=]).*/
	attr_accessor :remember_token, :activation_token, :reset_token

	validates :username, presence: true, uniqueness: { case_sensitive: false },
						format: { with: USERNAME_REGEX }
	validates :email, presence: true, format: { with: EMAIL_REGEX }
	validates :password, presence: true, format: { with: PASSWORD_REGEX }
	validates :salt, presence: true

	def email=(value)
		value = value.downcase if value.present?
		super
	end

	# Clears password after logout
	def clear_password
		self.password = nil
	end

	# Authenticates User
	def authenticate(username_or_email="", login_password="")
		if EMAIL_REGEX.match(username_or_email)
			user = User.find_by(email: username_or_email)
		else
			user = User.find_by(username: username_or_email)
		end
		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	# Matches the Password (returns if login_password matches database)
	def match_password(login_password="")
		self.password == BCrypt::Engine.hash_secret(login_password, salt)
	end

	# USER CONFIRMATION

	# Generates a new, random token
	def new_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(string)
		Digest::MD5.hexdigest string
	end

	# Activates the account
	def email_activate
		self.activated = true
		self.activation_digest = nil
		save!(validate: false)
	end

	# token generation
	def create_activation_digest
		self.activation_token = new_token
		self.activation_digest = new_token
	end

	# PASSWORD RESET

	def create_reset_digest
		self.reset_token = new_token
		update_attribute(:reset_digest, User.digest(reset_token))
		update_attribute(:reset_sent_at, Time.zone.now)
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def create_salt
		if self.salt.nil?
			self.salt = BCrypt::Engine.generate_salt
		end
	end

	# Returns true if a password reset has expired
	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end

	def valid_reset_token?(reset_token)
		reset_digest = User.digest(reset_token)
		reset_digest == self.reset_digest
	end

    # encrypts the password
	def encrypt_password
		if self.salt.nil?
			create_salt
		end
		if password.present?
			self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
		end
	end
end
