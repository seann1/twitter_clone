class Friendship < ActiveRecord::Base
  has_many :users
  belongs_to :user
  belongs_to :follower, :class_name => 'User'

end
