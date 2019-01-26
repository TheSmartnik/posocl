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
      generate_index
      generate_show
      generate_styles
    end

    private

    def generate_index
      page = get_template('index').render(feed)
      Dir.mkdir(BUILD_DIR) unless Dir.exists?(BUILD_DIR)
      File.open("#{BUILD_DIR}/index.html", 'w+') { |f| f.write page }
    end

    def generate_show
      feed.items.each do |item|
        page = get_template('show').render(item)
        Dir.mkdir(BUILD_DIR) unless Dir.exists?(BUILD_DIR)
        File.open("#{BUILD_DIR}/#{item.parametrized_title}.html", 'w+') { |f| f.write page }
      end
    end

    def generate_styles
      File.open("#{BUILD_DIR}/style.css", 'w+') do |f|
        f.write get_template('style', extension: 'scss').render
      end
    end

    def get_template(name, extension: 'html.slim')
      Tilt.new("#{__dir__}/templates/#{template_name}/#{name}.#{extension}")
    end
  end
end
