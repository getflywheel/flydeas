class User < ActiveRecord::Base
  attr_acessible :username, :email, :password
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
    	format: { with: /[a-zA-Z0-9\-_]{0,20}/ }
  validates :email, presence: true, format: { with: /[a-zA-Z_0-9.]+@getflywheel.com/ }
  validates :password, presence: true, 
	format: { with: /.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^+=]).*/ }
  validates :salt, presence: true
  
  def encrypt_password 
	  if password.present?
		  self.salt = BCrypt::Engine.hash_secret(password, salt)
		  self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
	  end
  end
  def clear_password
	  self.password = nil
  end

end
