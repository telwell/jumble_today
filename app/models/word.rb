class Word < ActiveRecord::Base
  has_many :jumble_words
  has_many :jumbles, through: :jumble_words
end
