class FollowingsController < ApplicationController
  before_filter :require_login

  def create
    @following = Following.new(params[:following])
    if @following.save
      redirect_to root_url, success: 'Following created'
    else
      redirect_to root_url, success: 'Error creating following'
    end
  end

end
