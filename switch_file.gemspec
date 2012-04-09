# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "switch_file/version"

Gem::Specification.new do |s|
  s.name        = "switch_file"
  s.version     = SwitchFile::VERSION
  s.authors     = ["George Mendoza"]
  s.email       = ["gsmendoza@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "switch_file"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'pow'
  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'valuable'

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"
end
