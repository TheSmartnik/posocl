module Posocl
  class FeedParser
    attr_reader :url

    def initialize(url:)
      @url = url
    end

    def call
      # TODO: Validate URL
      # TODO: Validate Feed
      Feed.new Nokogiri::XML.parse(open(url).read)
    end
  end
end
