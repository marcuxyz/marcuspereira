class HomeController < ApplicationController
  def index
    @posts = Post.includes(:resources).order('created_at desc').all
  end
end
