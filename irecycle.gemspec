
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "irecycle/version"

Gem::Specification.new do |spec|
  spec.name          = "irecycle"
  spec.version       = Irecycle::0.1.0
  spec.authors       = ["kotkoda7"]
  spec.email         = ["szilvia.hosser@gmail.com"]

  spec.summary       = %q{This is a gem that provides the user with Recycling Centers of certain materials close to a certain US zip}
  spec.homepage      = "https://github.com/kotkoda7/irecycle-CLI-gem"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"

  spec.add_dependency "nokogiri"


end
