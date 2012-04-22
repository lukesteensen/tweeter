class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, success: 'Signed up!'
    else
      render :new
    end
  end

  def index
    @users = User.all.reject{|u| u.id == current_user.id}
    @followings = {}
    @users.each do |u|
      unless Following.where(follower_id: current_user.id, followee_id: u.id).exists?
        @followings[u.id] = Following.new(follower_id: current_user.id, followee_id: u.id)
      end
    end
  end
end
