# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tasks_cli/version"

Gem::Specification.new do |s|
  s.name        = "tasks_cli"
  s.version     = TasksCli::VERSION
  s.authors     = ["vagmi"]
  s.email       = ["vagmi.mudumbai@gmail.com"]
  s.homepage    = "http://railspundit.com"
  s.summary     = %q{Manage your tasks in the command line}
  s.description = %q{Manage your tasks in the command line}

  s.rubyforge_project = "tasks_cli"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
