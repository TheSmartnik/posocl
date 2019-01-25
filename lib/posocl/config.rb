require 'yaml'
require 'ostruct'

module Posocl
  class Config < SimpleDelegator
    InvalidConfig = Class.new(ArgumentError)

    def initialize(path)
      config = YAML.load(File.read(path))['config']
      validate_config(config)
      super(OpenStruct.new(config))
    end

    private

    def validate_config(config)
      config.each do |key, value|
        if value.to_s.empty?
          raise InvalidConfig, "Config is invalid #{key} must be present"
        end
      end
    end
  end
end
