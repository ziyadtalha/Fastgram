class Users::SearchsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @people = @q.result(distinct: true)
  end
end
