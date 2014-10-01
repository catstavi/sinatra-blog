require 'sinatra'
require 'date'
require './lib/post'


class MyBlog < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/next" do
    erb :next
  end

  get "/about" do
    erb :about
  end

  get "/posts/*/*" do |date, name|
    erb :"/posts/#{date}/#{name}"
  end

end
