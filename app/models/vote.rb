class Vote < ActiveRecord::Base
    belongs_to :user, :submission
    :validates :submission_id, uniqueness: {scope: :user_id}
end
