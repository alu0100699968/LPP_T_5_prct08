# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exam/version'

Gem::Specification.new do |spec|
  spec.name          = "exam_LPP_T_5"
  spec.version       = Exam::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Jonathan Expósito", "Sergio Rodríguez"]
  spec.email         = ["alu0100696455@ull.edu.es", "alu0100699968@ull.edu.es"]
  spec.description   = %q{Gema para realizar tests}
  spec.summary       = %q{Gema para realizar tests}
  spec.homepage      = "https://github.com/alu0100699968/LPP_T_5_prct08"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~>2.11"

  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"

  spec.add_development_dependency "coveralls"

end
