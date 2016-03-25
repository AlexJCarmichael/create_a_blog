
class APICommentsController < ApplicationController
  def index
    make_comment_array
    render @comments.to_json
  end

  def show
    make_comment_array
    comment = @comments.find { |c| c.id == params[:id].to_i }
    if comment
      render comment.to_json
    else
      render_not_found
    end
  end

  def create
    post = App.posts.find { |p| p.id == params["id"].to_i }
    new_comment = Comment.new(params["body"], params["author"], post)
    render new_comment.to_json
  end

  def update
    comments = make_comment_array
    comment = comments.find { |c| c.id == params[:id].to_i }
    if params["body"] && params["author"]
      comment.body = params["body"]
      comment.author = params["author"]
      render comment.to_json
    elsif params["body"]
      comment.body = params["body"]
      render comment.to_json
    elsif params["author"]
      comment.author = params["author"]
      render comment.to_json
    else
      render_not_found
    end
  end

  def destroy
    comments = make_comment_array
    comment = comments.find { |c| c.id == params[:id].to_i }
    if comment
      post = App.posts.find { |p| p.id == comment.post_id.to_i }
      post.comments.delete(comment)
      render comment.to_json
    else
      render_not_found
    end
  end

  private
  def make_comment_array
    posts = App.posts
    @comments = posts.flat_map(&:comments)
  end

  def render_not_found
    return_message = {
      message: "Task not found!",
      status: '404'
    }.to_json
    render return_message, status: "404 NOT FOUND"
  end
end
