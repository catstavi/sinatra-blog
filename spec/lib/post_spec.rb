require "./lib/post.rb"

describe Post do
  describe '#self.all' do
    it 'returns an array' do
      expect(Post.all).to be_instance_of(Array)
    end
  end

  describe '#get_title' do
    it 'returns the contents of the <h3> with class title' do
      post =Post.new("./views/posts/2014-05-01/earliestpost.erb")
      expect(post.get_title).to eq "Earliest Test Post"
    end
  end
end
