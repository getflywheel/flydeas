class PostChange < ActiveRecord::Base
	belongs_to :submission
	belongs_to :change_object, polymorphic: true
	has_many :notifications, dependent: :destroy
	enum post_change_type: %i[vote status comment]
end
