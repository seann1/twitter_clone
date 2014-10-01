class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :followers, :class_name => 'Friendship', :foreign_key => 'person_id'
  has_many :following, :class_name => 'Friendship', :foreign_key => 'follower_id'
  has_many :comments, dependent: :destroy
  has_many :post_likes

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#   validates_presence_of :username
  after_create :signup_confirmation

  def signup_confirmation
#     UserMailer.signup_confirmation(self).deliver
  end
end
