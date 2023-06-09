require_relative 'lib/lotr_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "lotr_sdk"
  spec.version       = LotrSdk::VERSION
  spec.authors       = ["mike809"]
  spec.email         = ["michaelr@mirror.co"]

  spec.summary       = "A Ruby SDK for the Lord of the Rings API"
  spec.description   = "A Ruby SDK for the Lord of the Rings API"
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.add_dependency "activeresource"
  spec.add_dependency "dotenv-rails"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
