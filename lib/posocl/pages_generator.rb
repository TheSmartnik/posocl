module Posocl
  class PagesGenerator
    attr_reader :feed, :config

    def initialize(feed:, config:)
      @feed = feed
      @config = config
    end

    def call
      # Dir.glob
      generate_index
      generate_show
      generate_styles
    end

    private

    def generate_index
      page = get_template('index').render(GenerationContext.new(feed: feed, config: config))
      Dir.mkdir(build_dir) unless Dir.exists?(build_dir)
      File.open("#{build_dir}/index.html", 'w+') { |f| f.write page }
    end

    def generate_show
      feed.items.each do |item|
        page = get_template('show').render(GenerationContext.new(item: item, config: config))
        Dir.mkdir(build_dir) unless Dir.exists?(build_dir)
        File.open("#{build_dir}/#{item.parametrized_title}.html", 'w+') { |f| f.write page }
      end
    end

    def generate_styles
      Tilt.pipeline('scss.erb')

      File.open("#{build_dir}/style.css", 'w+') do |f|
        f.write get_template('style', extension: 'scss.erb').render(GenerationContext.new(config: config))
      end
    end

    def get_template(name, extension: 'html.slim')
      Tilt.new("#{__dir__}/templates/#{config.template['name']}/#{name}.#{extension}")
    end

    def build_dir
      @build_dir ||= begin
        dir = config.respond_to?(:build_dir) && config.build_dir || 'build'
        File.absolute_path(dir)
      end
    end
  end
end
