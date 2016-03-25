
class CommentsController < ApplicationController
  def show
  end
  def new
    @post = App.posts
    render_template "comments/new.html.erb"
  end
  def create
    post = App.posts.find { |p| p.id == params["pid"].to_i }
    Comment.new(params[:author], params[:body], post)
    redirect_to "/posts/#{post.id}"
  end
end
