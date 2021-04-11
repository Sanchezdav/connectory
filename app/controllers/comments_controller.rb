class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: "Error creating a comment: #{@comment.errors.full_messages.join(", ")}" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Comment was successfully destroyed."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
