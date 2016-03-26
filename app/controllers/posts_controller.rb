
class PostsController < ApplicationController
  def index
    @posts = App.posts
    render_template 'posts/index.html.erb'
  end

  def show
    @post = App.posts.find { |p| p.id == params[:id].to_i }
    if @post
      render_template 'posts/show.html.erb'
    else
      render ""
    end
  end

  def edit
    @post = App.posts.find { |p| p.id == params[:id].to_i }
    if @post
      render_template "posts/edit.html.erb"
    else
      render ""
    end
  end

  def new
    render_template "posts/new.html.erb"
  end

  def update
    post = App.posts.find { |p| p.id == params[:id].to_i }
    if post
      post.title = params["title"]
      post.author = params["author"]
      post.body = params["body"]
      redirect_to "/posts/#{post.id}"
    else
      render ""
    end
  end

  def create
    new_post = Post.new(params["title"], params["author"], params["body"])
    App.posts << new_post
    redirect_to "/posts/#{new_post.id}"
  end

  def destroy
    post = App.posts.find { |p| p.id == params[:id].to_i }
    App.posts.delete(post)
    redirect_to "/posts"
  end

end
