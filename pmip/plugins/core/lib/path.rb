class Path
  def initialize(path)
    @path = path.gsub('\\', '/')
    @path << '/' unless path =~ /\/$/
  end

  def each(glob, &blk)
    Dir.glob(@path + glob).each{|f| yield Filepath.new(f) }
  end

  def to_s
    @path
  end
end