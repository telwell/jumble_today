class Jumble < ActiveRecord::Base
	has_many :jumble_words
	has_many :words, through: :jumble_words
end
