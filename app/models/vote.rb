class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :submission
    validates :submission_id, uniqueness: {scope: :user_id}
end
