class User < ActiveRecord::Base
  #USERNAME_REGEX = /^[a-zA-Z0-9\-_]{0,20}$/
  EMAIL_REGEX = 
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
    	format: { with: /[a-zA-Z0-9\-_]{0,20}/ }
  validates :email, presence: true, format: { with: /[a-zA-Z_0-9.]+@getflywheel.com/ }
  validates :password, presence: true, 
	format: { with: /.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^+=]).*/ }
  validates :salt, presence: true
end
