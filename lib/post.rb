class Post
  attr_reader :title, :url, :path, :date

  def initialize(path)
    @path = path
    set_date
    set_url
    @title = get_title
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
  #
  # def format_title(path)
  #   title=path[25..-5]
  #   title.capitalize!
  #   title.gsub("-"," ")
  # end

  def get_title
    file=File.open(@path)
    file.each do |line|
      if line.include? "\"title\""
        clean_title(line)
        return line
      end
    end
  end

  def clean_title(line)
    line.gsub!(/<\S{2,3}>?/, "")
    line.gsub!(/>/,"")
    line.gsub!(/\n/, "")
    line.gsub!(/class ?= ?"title"/, "")
    line.gsub!(/^ +/,"")
  end

  def


  def read_file
    File.read(@path)
  end

  def self.most_recent_list
    date_sorted = all.sort_by { |post| post.date }
    date_sorted.reverse
  end

  def self.most_recent(n)
    most_recent_list[0...n]
  end

end
