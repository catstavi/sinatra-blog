class Post
  attr_accessor :title, :url

  def initialize(path)
    @url = path
    @title = format_title(path)
  end

  def self.all
    Dir["./views/posts/**.erb"].collect do |path|
      path.slice!(0..6)
      path.slice!(-4..-1)
      Post.new(path)
    end
  end

  def format_title(path)
    title=path.slice(7..-1)
    title.capitalize!
    title.gsub("-"," ")
  end
end
