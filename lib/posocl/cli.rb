require 'thor'
require 'posocl'

module Posocl
  class CLI < Thor
    DEFAULT_CONFIG_PATH = "#{Dir.pwd}/config.yml"

    desc "build", "Builds website out of rss feed"
    method_option :config, aliases: '-c', default: DEFAULT_CONFIG_PATH
    def build
      config = Config.new(options[:config])
      feed = FeedParser.new(url: config.url).call
      PagesGenerator.new(feed: feed, template_name: config.template).call
      puts "Website was successfully build"
    end
  end
end
