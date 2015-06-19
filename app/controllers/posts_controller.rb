class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body)
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path
    else
      flash[:alert] = "Post failed to create.  Please correct errors."
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comments = Comment.search(@post.id)
    @favourite = @post.favourite_for(current_user)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    flash[:notice] = "Successfully deleted post!"
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit(:title, :body)
    if @post.update post_params
      flash[:notice] = "Successfully updated post!"
      redirect_to posts_path
    else
      flash[:alert] = "Post failed to create."
      render :edit
    end
  end
end
