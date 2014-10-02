require 'sinatra'
require 'date'
require './lib/post'


class MyBlog < Sinatra::Base

  get "/" do
    @posts = Post.paged_posts[0]
    erb :index
  end

  get "/posts/1" do
    redirect to("/")
  end

  get "/posts/:num" do
    num = params[:num].to_i
    @posts = Post.paged_posts[num-1]
    @next_check = Post.paged_posts[num]
    @back_link = num-1
    @next_link = num+1
    erb :next
  end

  get "/about" do
    erb :about
  end

  get "/posts/*/*" do |date, name|
    erb :"/posts/#{date}/#{name}"
  end

  get "/*" do
    erb :notfound, layout: false
  end

end
