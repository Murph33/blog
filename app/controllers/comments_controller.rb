class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = Comment.new comment_params
    @comment.post_id = params[:post_id]
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render "/posts/show"
    end
  end

  def edit
    @comment = Comment.find params[:id]
    @post = Post.find params[:post_id]
  end

  def update
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.find params[:id]
    if @comment.update comment_params
      redirect_to post_path(@post)
    else
      render :edit, notice: "Failed to update."
    end
  end

  def destroy
    post = Post.find params[:post_id]
    comment = Comment.find params[:id]
    comment.destroy
    flash[:notice] = "Comment successfully deleted \n\n"
    redirect_to post
  end

end
