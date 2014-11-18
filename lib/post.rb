class Post
  attr_reader :title, :url, :path, :date, :name
  POSTS_PER_PAGE = 4

  def initialize(path)
    @path = path
    set_date
    set_url
    set_name
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

  def set_name
    @name = @path[25..-5]
  end

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

  def read_file_intro
    lines = ""
    file = File.open(@path)
    file.collect do |line|
      lines += line
      if line.include? "</p>"
        return lines
      end
    end
  end

  def read_file
    File.read(@path)
  end

  def self.most_recent_list
    date_sorted = all.sort_by { |post| post.date }
    @@date_sorted_list ||= date_sorted.reverse
  end

  def self.most_recent(n)
    most_recent_list[0...n]
  end

  def self.get_post_index(name)
    post_obj = most_recent_list.detect { |po| name == po.name}
    most_recent_list.find_index(post_obj)
  end

  def self.get_next(post_name)
    index = get_post_index(post_name)
    most_recent_list[index+1]
  end

  def self.get_prev(post_name)
    index = get_post_index(post_name)
    if index == 0
      nil
    else
      most_recent_list[index-1]
    end
  end

  def self.paged_posts
    self.most_recent_list.each_slice(POSTS_PER_PAGE).to_a
  end

end
