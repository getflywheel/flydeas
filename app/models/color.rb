class Color < ActiveRecord::Base
    validates :name, presence: true
end
