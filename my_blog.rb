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
    # find this post's index in the most_recent_list
    # then pass the next one and get date/title for the link
    @next_post = Post.get_next(name)
    @prev_post = Post.get_prev(name)
    # @next = "#{@prev_post.date.to_s} / #{@prev_post.name}"
    # @prev_post = "/#{@prev_post.date.to_s}/#{@prev_post.name}"
    erb :"/posts/#{date}/#{name}"
  end

  get "/*" do
    erb :notfound, layout: false
  end

end
