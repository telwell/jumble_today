class UserJumble < ActiveRecord::Base
	belongs_to :user
	belongs_to :jumble
	validates_uniqueness_of :user_id, scope: :jumble_id
end
