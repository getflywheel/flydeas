class User < ActiveRecord::Base

    USERNAME_REGEX = /[a-zA-Z0-9\-_]{0,20}/
    EMAIL_REGEX = /[a-zA-Z_0-9-.]+@getflywheel.com/i
    PASSWORD_REGEX = /.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^+=]).*/ 
	attr_accessor :remember_token, :activation_token, :reset_token
	
	#NOT FINAL IMPLEMENTATION
	before_save :downcase_email
	before_create :create_activation_digest 

    validates :username, presence: true, uniqueness: { case_sensitive: false }, 
    	format: { with:  USERNAME_REGEX}
    validates :email, presence: true, format: { with: EMAIL_REGEX }
    validates :password, presence: true, format: { with: PASSWORD_REGEX}
    validates :salt, presence: true

    #PASSWORD STUFF
	#encrypts the password
    def encrypt_password 
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
        end
    end

	#Clears password after logout
    def clear_password
          self.password = nil
    end

	#Authenticates User
   def authenticate(username_or_email="", login_password="")
        if EMAIL_REGEX.match(username_or_email)
            user = User.find_by_email(username_or_email)
        else
            user = User.find_by_username(username_or_email)
        end
        if user && user.match_password(login_password)
            return user
        else
            return false
        end
    end

	#Matches the Password (returns if login_password matches database)
    def match_password(login_password="")
        self.password == BCrypt::Engine.hash_secret(login_password, salt)
    end

    #USER CONFIRMATION
    #Generates a new, random token
	def new_token
		SecureRandom.urlsafe_base64
    end

    #activates the account
    def email_activate
        self.activated = true
        self.activation_digest = nil
        save!(:validate => false)
    end
    
 

    #PASSWORD RESET
	def create_reset_digest
        # TODO: Set up tokenization
        reset_token = new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    private
    #makes email lowercase for easier searching
	def downcase_email
		self.email = email.downcase
    end
    
    #token generation
	def create_activation_digest
		self.activation_token = new_token
        self.activation_digest = new_token
	end
end
