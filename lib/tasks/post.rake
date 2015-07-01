namespace :post do
  desc "Tasks associated with posts"
  task comments: :environment do
    new_comments = []
    Comment.where("created_at > ?", 1.day.ago).each {|comment| new_comments << comment}
    sorted_new_comments = new_comments.sort_by { |comment| comment.post.user }
    new_comments.each  { |comment| p comment.post.user }
    p sorted_new_comments == new_comments
    sorted_new_comments.each  { |comment| p comment.post.user }
    @clustered_comments = sorted_new_comments.cluster { |comment| comment.post.user }
    @clustered_comments.each {|c| p c[0].post.user.email}
    PostsMailer.notify_post_owners_summary(@clustered_comments).deliver_now
  end
end


# Stretch: Setup a rake task that does the following:
# Make a summary (list) of all newly created comments that that day for posts
# Send an email with the summary to posts owners

#find all comments less than a day old
#
#group them somehow
#
#User.all.each
#Post.all.each do |post|
#  post.comments.where("created_at < ?", 1.day.ago).each do |comment|
#    p comment.body
#  end
#end
