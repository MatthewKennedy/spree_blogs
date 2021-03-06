module SpreeBlogs
  module_function

  # Returns the version of the currently loaded SpreeBlogs as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 1
    MINOR = 0
    TINY = 2
    PRE = nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
  end
end
