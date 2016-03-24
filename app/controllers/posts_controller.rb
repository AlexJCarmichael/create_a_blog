
class PostsController < ApplicationController
  def index
    @posts = App.posts
    render_template 'posts/index.html.erb'
  end
  def show
    @post = App.posts.find { |p| p.id == params[:id].to_i }
    render_template 'posts/show.html.erb'
  end
end
