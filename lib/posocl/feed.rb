module Posocl
  class Feed
    attr_reader :xml

    def initialize(xml)
      @xml = xml
    end

    def items
      @items ||=  xml.xpath('//item').map do |item|
        FeedItem.new(
          item.xpath('title').text(),
          item.xpath('description').text(),
          item.xpath('itunes:image').attr('href').value,
          DateTime.parse(item.xpath('pubDate').text()),
          item.xpath('itunes:duration').text(),
          item.xpath('link').text(),
          item.xpath('enclosure').attr('url').value
        )
      end
    end

    def podcast
      @podcast ||= Podcast.new(
        xml.xpath('//channel/image/url').text(),
        xml.xpath('//channel/title').text(),
        xml.xpath('//channel/description').text(),
      )
    end
  end
end
