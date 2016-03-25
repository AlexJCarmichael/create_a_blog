
class APIPostsController < ApplicationController
  def index
    render App.posts.to_json
  end

  def show
    @post = App.posts.find { |p| p.id == params[:id].to_i }
    if @post
      render_template 'posts/show.html.erb'
    else
      render ""
    end
  end

  def new
    render_template "posts/new.html.erb"
  end

  def create
    new_post = Post.new(params[:title], params[:author], params[:body])
    App.posts << new_post
    redirect_to "/posts/#{new_post.id}"
  end
end
