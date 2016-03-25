
class CommentsController < ApplicationController
  def show
  end
  def new
    render_template "comments/new.html.erb"
  end
  def create
    # new_comment = Comment.new(params[:author], params[:body])
    # App.posts << new_post
    # redirect_to "/posts/#{post.id}"
  end
end
