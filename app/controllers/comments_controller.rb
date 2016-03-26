
class CommentsController < ApplicationController
  def show
  end
  def new
    binding.pry
    @post = App.posts
    render_template "comments/new.html.erb"
  end

  def edit
    comments = make_comment_array
    @comment = comments.find { |c| c.id == params["cid"].to_i }
    render_template "comments/edit.html.erb"
  end

  def update
    comments = make_comment_array
    comment = comments.find { |c| c.id == params["cid"].to_i }
    post = comment.post_id
    if comment
      comment.author = params["author"]
      comment.body = params["body"]
      redirect_to "/posts/#{post}"
    else
      render ""
    end
  end

  def create
    post = App.posts.find { |p| p.id == params["pid"].to_i }
    Comment.new(params[:author], params[:body], post)
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    comments = make_comment_array
    comment = comments.find { |p| p.id == params[:id].to_i }
    if comment
      post = App.posts.find { |p| p.id == comment.post_id }
      post.comments.delete(comment)
      redirect_to "/posts"
    else
      render ""
    end
  end

  private
  def make_comment_array
    posts = App.posts
    @comments = posts.flat_map(&:comments)
  end
end
