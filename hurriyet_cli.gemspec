# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hurriyet_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'hurriyet_cli'
  spec.version       = HurriyetCli::VERSION
  spec.authors       = ['Ender Ahmet Yurt']
  spec.email         = ['enderyurt@gmail.com']

  spec.summary       = 'Hurriyet News for hackers'
  spec.description   = 'A Ruby CLI via Hurriyet Public API via https://github.com/hurriyet/developers.hurriyet.com.tr'
  spec.homepage      = 'http://rubygems.org/gems/hurriyet_cli'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['hurriyet_cli']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'thor'
  spec.add_dependency 'hurriyet'
  spec.add_dependency 'rainbow'
  spec.add_dependency 'rubocop', '~> 0.45.0'
  spec.add_dependency 'activesupport'
end
