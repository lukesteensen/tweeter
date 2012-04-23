module ApplicationHelper
  def page(str)
    case str
    when :home
      params[:controller] == 'posts' and params[:action] == 'index'
    when :new_post
      params[:controller] == 'posts' and params[:action] == 'new'
    when :users
      params[:controller] == 'users' and params[:action] == 'index'
    end
  end
end
