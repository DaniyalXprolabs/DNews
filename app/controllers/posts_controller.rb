class PostsController < ApplicationController
  def index
    @post=Post.all
    @categories=Category.all
  end
end
