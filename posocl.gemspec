
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "posocl/version"

Gem::Specification.new do |spec|
  spec.name          = "posocl"
  spec.version       = Posocl::VERSION
  spec.authors       = [" TheSmartnik"]
  spec.email         = ["misharinn@gmail.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "nokogiri"
  spec.add_dependency "tilt"
  spec.add_dependency "tilt-pipeline"
  spec.add_dependency "slim"
  spec.add_dependency "sass"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "pry"
end
