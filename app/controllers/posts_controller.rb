
class PostsController < ApplicationController
  def index
    render App.posts.to_json
  end
end
