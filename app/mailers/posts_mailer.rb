class PostsMailer < ApplicationMailer

  def notify_post_owner (comment)
    @comment = comment
    @user = @comment.post.user
    mail(to: @user.email, subject: "Someone commented on your post")
  end
end
