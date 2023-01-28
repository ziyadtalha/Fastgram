class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)

    @post = Post.find(@comment.post_id)

    respond_to do |format|
      if @comment.save
        #had to do redirect_to view_post_path(@post) instead of @comment.post because I have not made posts as resources ig
        format.html { redirect_to view_post_path(@post), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Error!" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    if ((current_user.id == @comment.user_id) || (current_user.id == @post.user_id))
      @comment.destroy
      redirect_to view_post_path(@post)
    else
      flash[:notice] = "Cannot delete other user's comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :text).with_defaults(user_id: current_user.id)
  end

end
