class JumbleWord < ActiveRecord::Base
  belongs_to :jumble
  belongs_to :word
end
