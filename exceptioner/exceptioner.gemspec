# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "exceptioner/version"

Gem::Specification.new do |s|
  s.name        = "exceptioner"
  s.version     = Exceptioner::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michał Łomnicki", "Jan Dudek", "Piotr Niełacny", "Paweł Pacana", "Staszek Kolarzowski"]
  s.email       = ["michal.lomnicki@gmail.com", "jd@jandudek.com", "piotr.nielacny@gmail.com", "pawel.pacana@gmail.com", "stanislaw.kolarzowski@gmail.com"]
  s.homepage    = "https://github.com/mlomnicki/exceptioner"
  s.summary     = "Stay notified of exceptions raised by your application. Choose from various notification methods like Email, Jabber or IRC"
  s.description = "Exceptioner is meant to be a replacement for hoptoad, exception_notification or getexceptional. It's fully customizable and works with each kind of ruby application"

  s.rubyforge_project = "exceptioner"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("exceptioner-core", "~> 0.6.0") if ENV['EXCEPTIONER_BUILD']
  s.add_dependency("exceptioner-mail", "~> 0.0.1")
  s.add_dependency("exceptioner-http", "~> 0.0.1")

  eval File.read(File.join(File.dirname(__FILE__), '../development_dependencies.rb'))
end
