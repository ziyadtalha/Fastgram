class PostsController < ApplicationController

  #what this does is that it checks if a user is logged in
  #it comes with Devise gem
  before_action :authenticate_user!

  #same as view but for when a post is accessed by another user
  #def public
  #  @post = Post.find(params[:id])
  #  @comment = @post.comments.build
  #end

  #the create_post page is only returned if a user is actually logged in
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to view_post_path(@post), flash: { alert: "Posted" }
    else
      flash[:alert] = "Incorrect!"
      render :new, status: :unprocessable_entity
    end

  end

  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def view
    @post = Post.find(params[:id])
    #@like = @post.likes.build
    @comment = @post.comments.build
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to "/view_posts", flash: { alert: "Deleted" }
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      #keep flash before redirect, otherwise it throws error although the post updates and redirection is done
      flash[:alert] = "Edited Post!"
      redirect_to "/view_posts"
    else
      flash[:alert] = "Incorrect!"
      render :new, status: :unprocessable
     end
  end

  private

  def post_params
    params.require(:post).permit(:id, :caption, :images => []).with_defaults(user_id: current_user.id)
  end

end
