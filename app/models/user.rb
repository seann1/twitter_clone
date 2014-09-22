class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :followers, :class_name => 'Friendship', :foreign_key => 'person_id'
  has_many :following, :class_name => 'Friendship', :foreign_key => 'follower_id'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#   validates_presence_of :username
  after_create :signup_confirmation

  def signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
