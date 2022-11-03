# coding: utf-8
require_relative 'lib/fake_s3'

Gem::Specification.new do |spec|
  spec.name          = "fake_s3"
  spec.version       = FakeS3::VERSION
  spec.authors       = ["Jeremy Lightsmith"]
  spec.email         = ["jeremy.lightsmith@gmail.com"]

  spec.summary       = %q{A fake library that mirrors the S3 part of aws-sdk for ruby}
  spec.description   = %q{Use this library for unit testing S3 on ruby}
  spec.homepage      = "https://github.com/transparentclassroom/fake_s3"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.4'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 13.0"

  # spec.add_dependency 'colorize'
end
