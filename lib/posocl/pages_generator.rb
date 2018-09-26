module Posocl
  class PagesGenerator
    BUILD_DIR = "#{__dir__.gsub('lib/posocl', '')}/build".freeze

    attr_reader :feed, :template_name

    def initialize(feed:, template_name:)
      @feed = feed
      @template_name = template_name
    end

    def call
      # Dir.glob
      template = Tilt.new("#{__dir__}/templates/#{template_name}/index.html.slim")
      page = template.render(feed)
      Dir.mkdir(BUILD_DIR) unless Dir.exists?(BUILD_DIR)
      File.open("#{BUILD_DIR}/index.html", 'w+') { |f| f.write page }
    end
  end
end
