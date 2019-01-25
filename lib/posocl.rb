require "posocl/version"

module Posocl
  require 'nokogiri'
  require 'open-uri' # TODO: Replace?

  require 'posocl/feed'
  require 'posocl/feed_item'
  require 'posocl/podcast'
  require 'posocl/feed_parser'
  require 'posocl/pages_generator'
  require 'posocl/config'
  require 'tilt'
  require 'slim'
  require 'pry'
end
