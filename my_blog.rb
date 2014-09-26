require 'sinatra'
require './lib/post'

class MyBlog < Sinatra::Base

  get "/" do
    erb :index
  end

  # get "/contact" do
  #   erb :contact
  # end
  #
  get "/blog" do
    erb :blog
  end

  get "/about" do
    erb :about
  end

  get "/posts/:filename" do
    filename = params[:filename]
    erb :"/posts/#{filename}"
  end

end
