class Account::PostsController < ApplicationController
  def index
    @posts = current_user.posts.order("posts_count DESC")
  end
end
