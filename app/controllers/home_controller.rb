class HomeController < ApplicationController
  def index
    @posts = Post.all
    render("home/index.html.erb")
  end
  
end