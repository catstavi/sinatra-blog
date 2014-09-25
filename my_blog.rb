require 'sinatra'

class MyBlog < Sinatra::Base
  get "/" do
    erb :index
  end
end
