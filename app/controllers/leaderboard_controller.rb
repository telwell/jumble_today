class LeaderboardController < ApplicationController

	def index
		@users = User.joins(:user_jumbles)
			.select(:id, :username, "count(user_id) as count")
			.group(:user_id, :id)
			.order("count desc", :created_at)
	end

end
