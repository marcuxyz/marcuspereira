class HomeController < ApplicationController
  def index
    @posts = Post.includes(:resources).all
  end
end
