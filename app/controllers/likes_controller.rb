class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    Like.create(user: current_user, post: @post)
    redirect_to @post
  end

  def destroy
    like = Like.where(user_id: current_user.id, post_id: @post.id).first
    like.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
