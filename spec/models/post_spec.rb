require 'rails_helper'

describe Post do
  it "find mentions of other users" do
    user1 = User.create(:username => "test")
    user2 = User.create(:username => "testing")
    testPost = Post.new(:user_id => user1.id, :body => "@testing")
    binding.pry
    expect(testPost.check_for_mentions).to eq ["testing"]
  end

end
