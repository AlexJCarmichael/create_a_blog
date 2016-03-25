
class APIPostsController < ApplicationController
  def index
    render App.posts.to_json
  end

  def show
    post = App.posts.find { |p| p.id == params[:id].to_i }
    if post
      render post.to_json
    else
      render_not_found
    end
  end

  def create
    new_post = Post.new(params["title"], params["author"], params["body"])
    App.posts << new_post
    redirect_to "/posts/#{new_post.id}"
  end

  def update
    post = App.posts.find { |p| p.id == params[:id].to_i }
    if params["body"] && params["author"] && params["title"]
      post.body = params["body"]
      post.author = params["author"]
      post.title = params["title"]
      render post.to_json
    elsif params["body"] && params["title"]
      post.body = params["body"]
      post.title = params["title"]
      render post.to_json
    elsif params["title"] && params["author"]
      post.body = params["body"]
      post.author = params["author"]
      render post.to_json
    elsif params["body"] && params["author"]
      post.body = params["body"]
      post.author = params["author"]
      render post.to_json
    elsif params["body"]
      post.body = params["body"]
      render post.to_json
    elsif params["title"]
      post.title = params["title"]
      render post.to_json
    elsif params["author"]
      post.author = params["author"]
      render post.to_json
    else
      render_not_found
    end
  end

  def destroy
    post = App.posts.find { |p| p.id == params[:id].to_i }
    if post
      App.posts.delete(post)
        render post.to_json
    else
      render_not_found
    end
  end

  private
  def render_not_found
    return_message = {
      message: "Task not found!",
      status: '404'
    }.to_json
    render return_message, status: "404 NOT FOUND"
  end
end
