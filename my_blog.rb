require 'sinatra'
require 'date'
require './lib/post'


class MyBlog < Sinatra::Base

  get "/" do
    @posts = Post.paged_posts[0]
    erb :index
  end

  get "/next/:num" do
    num = params[:num].to_i
    @posts = Post.paged_posts[num]
    erb :next
  end

  get "/about" do
    erb :about
  end

  get "/posts/*/*" do |date, name|
    erb :"/posts/#{date}/#{name}"
  end

end
