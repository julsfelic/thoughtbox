class LinksDecorator
  attr_reader :link, :links

  def initialize(options)
    @link = options[:link]
    @links = options[:links] || []
  end
end
