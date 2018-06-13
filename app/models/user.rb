class User < ActiveRecord::Base

    USERNAME_REGEX = /[a-zA-Z0-9\-_]{0,20}/
    EMAIL_REGEX = /[a-zA-Z_0-9.]+@getflywheel.com/
    PASSWORD_REGEX = /.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^+=]).*/ 

    validates :username, presence: true, uniqueness: { case_sensitive: false }, 
    	format: { with:  USERNAME_REGEX}
    validates :email, presence: true, format: { with: EMAIL_REGEX }
    validates :password, presence: true, format: { with: PASSWORD_REGEX}
    validates :salt, presence: true

    def encrypt_password 
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
        end
    end

    def clear_password
          self.password = nil
    end

    def self.authenticate(username_or_email="", login_password="")
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

    def match_password(login_password="")
        self.password == BCrypt::Engine.hash_secret(login_password, salt)
    end
end
