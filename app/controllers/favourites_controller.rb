class FavouritesController < ApplicationController


  before_action :authenticate_user!

  def create
    post = Post.find params[:post_id]
    favourite = post.favourites.new
    favourite.user = current_user
    if favourite.save
      redirect_to post, notice: "Post favourited"
    else
      redirect_to post, alert: "Error!"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favourite = current_user.favourites.find_by_post_id(post)
    favourite.destroy
    redirect_to post, notice: "Un-favourited"
  end

  def index
    @favourites = current_user.favourites
  end

end
