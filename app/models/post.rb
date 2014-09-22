class Post < ActiveRecord::Base
  belongs_to :user

  before_save :check_for_mentions

  def check_for_mentions
    users = User.all.map { |user| user.username }
    body_split = self.body.split(" ")
    stripped_array = []
    body_split.each do |i|
     stripped_name = i.gsub(/[^a-z ]/, '')
     stripped_array << stripped_name
    end

    @mentions = []

    stripped_array.each do |i|
      if body_split.include?(i)
        @mentions << i
      end
    end
    @mentions
  end
 end
