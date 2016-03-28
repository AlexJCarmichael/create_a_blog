require 'webrick'
require 'socket'
require 'timeout'
require 'uri'
require 'erb'
require 'json'
require 'pry'
require_relative '../config/router'
require_relative '../app/controllers/application_controller'
require_relative '../lib/all'

module App
  # Place all data here inside of a method
  def App.posts
    @all_posts ||= [
      Post.new("Title", "Bob", "Sed lectus. Quisque id odio. Suspendisse non nisl sit amet velit hendrerit rutrum."),
      Post.new("Second Title", "Reginald", "Fusce risus nisl, viverra et, tempor et, pretium in, sapien. Ut varius tincidunt libero. Vivamus laoreet. Aenean imperdiet. Fusce risus nisl, viverra et, tempor et, pretium in, sapien. In auctor lobortis lacus. Nulla consequat massa quis enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Phasellus gravida semper nisi. Fusce fermentum."),
      Post.new("Third Title", "George", "Nulla consequat massa quis enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Phasellus gravida semper nisi. Fusce fermentum. Nulla consequat massa quis enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Phasellus gravida semper nisi. Fusce fermentum.")
    ]
  end
  def App.tweets
    # This is an example
    @all_tweets ||= [
      { message: "cool tweet!", id: 1},
      { message: "badd tweet!", id: 2},
      { message: "ohno tweet!", id: 3},
      { message: "eehhh tweet", id: 4},
    ]
  end
end

App.posts.each do |post|
  rand(1..3).times do
    Comment.new("This is a comment", "George", post)
  end
end

system('clear')

def start_custom_webbrick_server
  server = WEBrick::HTTPServer.new(Port: 3001)
  server.mount "/", WEBBrickServer

  trap(:INT)  { server.shutdown }
  trap(:TERM) { server.shutdown }

  puts "The server is running and awaiting requests at http://localhost:3001/"
  server.start
end

def start_custom_tcp_server
  CustomTCPServer.new.start
end


if ARGV[0] == '--no-webrick'
  start_custom_tcp_server
else
  start_custom_webbrick_server
end
