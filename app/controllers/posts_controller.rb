class PostsController < ApplicationController
  before_action :set_post , only: [:show,:destroy,:update,:edit]
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order(id: :desc) 
    #@posts=Post.paginate(page: params[:page], per_page:5).order(id: :desc)
    @categories=Category.limit(10)
  end

  def show
  end

  def new
    @post=Post.new
  end

  def create
    if @post.save
      flash[:notice]="Post was saved successfully"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated Successfully"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def hobby
    posts_for_branch(params[:action])
   end

  def study
    posts_for_branch(params[:action])
   end

  def team
    posts_for_branch(params[:action])
   end


  private

  def posts_for_branch(branch)

  end
  def post_params
    params.require(:post).permit(:title,:content)
  end

  def set_post
    @post=Post.find(params[:id])
  end
end


