# -*- encoding: utf-8 -*-
# stub: legato 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "legato"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tony Pitale"]
  s.date = "2015-06-11"
  s.description = "Access the Google Analytics Core Reporting and Management APIs with Ruby. Create models for metrics and dimensions. Filter your data to tell you what you need."
  s.email = ["tpitale@gmail.com"]
  s.executables = ["legato"]
  s.files = ["bin/legato"]
  s.homepage = "http://github.com/tpitale/legato"
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "legato"
  s.rubygems_version = "2.4.5"
  s.summary = "Access the Google Analytics API with Ruby"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<vcr>, ["= 2.0.0.beta2"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<vcr>, ["= 2.0.0.beta2"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<vcr>, ["= 2.0.0.beta2"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
  end
end
