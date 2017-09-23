class LeaderboardController < ApplicationController

  def index
    @users = User.joins(:user_jumbles)
      .select(:id, :username, "count(user_id) as victories")
      .group(:user_id, :id)
      .order("victories desc", :created_at)

    # Used to store the last user's stats for ties
    @last = { :victories => nil, :i => nil }
  end

end
