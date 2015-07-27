# -*- encoding: utf-8 -*-
# stub: hydra-core 9.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-core"
  s.version = "9.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matt Zumwalt, Bess Sadler, Julie Meloni, Naomi Dushay, Jessie Keck, John Scofield, Justin Coyne & many more.  See https://github.com/projecthydra/hydra-head/contributors"]
  s.date = "2015-07-08"
  s.description = "Hydra-Head is a Rails Engine containing the core code for a Hydra application. The full hydra stack includes: Blacklight, Fedora, Solr, active-fedora, solrizer, and om"
  s.email = ["hydra-tech@googlegroups.com"]
  s.homepage = "http://projecthydra.org"
  s.licenses = ["APACHE2"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.5"
  s.summary = "Hydra-Head Rails Engine (requires Rails3)"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_runtime_dependency(%q<hydra-access-controls>, ["= 9.2.0"])
      s.add_runtime_dependency(%q<jettywrapper>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<active-fedora>, ["~> 9.1"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_development_dependency(%q<factory_girl_rails>, ["~> 4.2"])
    else
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<hydra-access-controls>, ["= 9.2.0"])
      s.add_dependency(%q<jettywrapper>, [">= 2.0.0"])
      s.add_dependency(%q<active-fedora>, ["~> 9.1"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_dependency(%q<factory_girl_rails>, ["~> 4.2"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<hydra-access-controls>, ["= 9.2.0"])
    s.add_dependency(%q<jettywrapper>, [">= 2.0.0"])
    s.add_dependency(%q<active-fedora>, ["~> 9.1"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    s.add_dependency(%q<yard>, ["~> 0.8.7"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
    s.add_dependency(%q<factory_girl_rails>, ["~> 4.2"])
  end
end
