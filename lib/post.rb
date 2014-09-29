class Post
  attr_accessor :title, :url, :path

  def initialize(path)
    @path = path
    set_url
    @title = format_title(@url)
  end

  def self.all
    Dir["./views/posts/**.erb"].collect do |path|
      Post.new(path)
    end
  end

  def set_url
    @url = @path[7..-5]
  end

  def format_title(path)
    title=path.slice(7..-1)
    title.capitalize!
    title.gsub("-"," ")
  end

  def read_file
    File.read(@path)
  end
end
