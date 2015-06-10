class CommentsController < ApplicationController

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = Comment.new comment_params
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong!"
      render "/posts/show"
    end
  end

end
