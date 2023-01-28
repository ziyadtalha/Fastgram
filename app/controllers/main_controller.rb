class MainController < ApplicationController
  #except is used since we want non-users to also access the homepage
  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def following
    @followedUsers = current_user.followings
  end

  #we only want signed in users to be able to view posts
  def public
    @posts = Post.all
  end

end
