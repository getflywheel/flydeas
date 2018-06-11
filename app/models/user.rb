class User < ActiveRecord::Base
  validates :username
  validates :email 
  validates :password
  validates :salt
end
