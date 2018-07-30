class Notification < ActiveRecord::Base
	belongs_to :user
	belongs_to :post_change

	validates :user, uniqueness: { scope: :post_change }
	validates_associated :post_change
end
