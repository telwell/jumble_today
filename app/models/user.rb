class User < ActiveRecord::Base
	has_many :user_jumbles
	has_many :jumbles, through: :user_jumbles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
end
