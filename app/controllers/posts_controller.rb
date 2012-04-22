class PostsController < ApplicationController
  before_filter :require_login

  def index
    @posts = Post.order('created_at desc').all.select do |p|
      p.user == current_user or Following.where(follower_id: current_user.id, followee_id: p.user.id).exists?
    end
    @topics = Topic.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      @post.body.scan(/\B#(\w+)/i).each do |s|
        Topic.vote(s.first)
      end
      redirect_to root_url
    else
      render :new
    end
  end

end
