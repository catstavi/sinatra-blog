require 'sinatra'
require 'date'
require './lib/post'


class MyBlog < Sinatra::Base

  get "/" do
    erb :index
  end

  # get "/contact" do
  #   erb :contact
  # end
  #

  get "/next" do
    erb :next
  end
  
  get "/about" do
    erb :about
  end
  #
  # get "/posts/post1" do
  #   erb :"/posts/2014-09-28/post1"
  # end

  get "/posts/*/*" do |date, name|
    erb :"/posts/#{date}/#{name}"
  end

end
