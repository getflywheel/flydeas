class Color < ActiveRecord::Base
    has_many :colors
    validates :name, presence: true
end
