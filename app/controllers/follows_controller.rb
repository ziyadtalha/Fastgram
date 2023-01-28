class FollowsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_user

  def new
    @follow = Follow.new
  end

  def showFollowers
    @follow_list = @user.followers
  end

  def showFollowing
    @follow_list = @user.followings
  end

  def create
    if already_followed?
      flash[:notice] = "You can't follow more than once"
    else
      @user.received_follows.create(follower_id: current_user.id)
    end
    redirect_to view_profile_path(@user)
  end

  def destroy
    if already_followed?
      @follow = @user.received_follows.find_by(follower_id: current_user.id)
      @follow.destroy
    else
      flash[:notice] = "You can't unfollow more than once"
    end
    redirect_to view_profile_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def already_followed?
    Follow.where(follower_id: current_user.id, followed_id: params[:id]).exists?
  end

end
