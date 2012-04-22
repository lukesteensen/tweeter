class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:name], params[:password])
    if user
      redirect_back_or_to root_url, success: 'Logged in'
    else
      flash.now.alert = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, success: 'Logged out'
  end
end
