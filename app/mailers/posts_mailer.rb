class PostsMailer < ApplicationMailer

  def notify_post_owner (comment)
    @comment = comment
    @user = @comment.post.user
    mail(to: @user.email, subject: "Someone commented on your post")
  end

  def notify_post_owners_summary clustered_array
    clustered_array.each_with_index do |cluster, i|
      @cluster = cluster
      mail(to: @cluster[0].post.user.email, subject: "Comments in the last 24 hours")
    end
  end
end
