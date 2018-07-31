class Status < ActiveRecord::Base
	has_many :submissions
	validates :name, :presence => true
	attr_accessor :status_id
end
