require 'sinatra'
require 'date'
require './lib/post'


class MyBlog < Sinatra::Base

  get "/" do
    @posts = Post.paged_posts[0]
    erb :index
  end

  get "posts/0" do
    redirect to "/"
  end

  get "/posts/:num" do
    num = params[:num].to_i
    @next_link = num+1
    @back_link = num-1
    @posts = Post.paged_posts[num-1]
    erb :next
  end

  get "/about" do
    erb :about
  end

  get "/posts/*/*" do |date, name|
    erb :"/posts/#{date}/#{name}"
  end

  get "/0" do
    redirect to "/"
  end

end
