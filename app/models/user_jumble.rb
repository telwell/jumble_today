class UserJumble < ActiveRecord::Base
	belongs_to :user
	belongs_to :jumble
end
