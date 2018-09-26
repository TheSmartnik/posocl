require 'thor'
require 'posocl'

module Posocl
  class CLI < Thor
    DEFAULT_TEMPLATE = 'bootstrap'

    desc "build", "Builds website out of rss feed"
    method_option :url, aliases: '-u', required: true
    method_option :template, aliases: '-t', default: DEFAULT_TEMPLATE
    def build
      feed = FeedParser.new(url: options[:url]).call
      PagesGenerator.new(feed: feed, template_name: options[:template]).call
    end
  end
end
