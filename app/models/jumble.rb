class Jumble < ActiveRecord::Base
  has_many :jumble_words
  has_many :words, through: :jumble_words
  has_many :user_jumbles
  has_many :users, through: :user_jumbles
end
