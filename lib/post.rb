class Post
  attr_reader :title, :url, :path, :date

  def initialize(path)
    @path = path
    set_date
    set_url
    @title = format_title(@path)
  end

  def self.all
    Dir["./views/posts/**/**.erb"].collect do |path|
      Post.new(path)
    end
  end

  def set_url
    @url = @path[7..-5]
  end

  def set_date
    @date = DateTime.parse(@path[14..23])
  end

  # def display_date
  #   "Day #{@date.day}, Month #{@date.month}, Year #{@date.year}"
  # end

  def format_title(path)
    title=path[25..-5]
    title.capitalize!
    title.gsub("-"," ")
  end

  def read_file
    File.read(@path)
  end

  def self.most_recent_list
    date_sorted = all.sort_by { |post| post.date }
    date_sorted.reverse
  end

end
