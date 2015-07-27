# -*- encoding: utf-8 -*-
# stub: blacklight-gallery 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "blacklight-gallery"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Beer"]
  s.date = "2015-04-10"
  s.email = ["cabeer@stanford.edu"]
  s.homepage = "https://github.com/projectblacklight/blacklight-gallery"
  s.licenses = ["Apache 2.0"]
  s.rubygems_version = "2.4.5"
  s.summary = "Gallery display for Blacklight"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<blacklight>, ["~> 5.12"])
      s.add_runtime_dependency(%q<bootstrap-sass>, ["~> 3.0"])
      s.add_runtime_dependency(%q<openseadragon>, [">= 0.2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-its>, [">= 0"])
      s.add_development_dependency(%q<rspec-activemodel-mocks>, [">= 0"])
      s.add_development_dependency(%q<rspec-collection_matchers>, [">= 0"])
      s.add_development_dependency(%q<jettywrapper>, [">= 0"])
      s.add_development_dependency(%q<engine_cart>, ["~> 0.6"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<poltergeist>, [">= 1.5.0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<blacklight>, ["~> 5.12"])
      s.add_dependency(%q<bootstrap-sass>, ["~> 3.0"])
      s.add_dependency(%q<openseadragon>, [">= 0.2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_dependency(%q<rspec-its>, [">= 0"])
      s.add_dependency(%q<rspec-activemodel-mocks>, [">= 0"])
      s.add_dependency(%q<rspec-collection_matchers>, [">= 0"])
      s.add_dependency(%q<jettywrapper>, [">= 0"])
      s.add_dependency(%q<engine_cart>, ["~> 0.6"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<poltergeist>, [">= 1.5.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<blacklight>, ["~> 5.12"])
    s.add_dependency(%q<bootstrap-sass>, ["~> 3.0"])
    s.add_dependency(%q<openseadragon>, [">= 0.2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
    s.add_dependency(%q<rspec-its>, [">= 0"])
    s.add_dependency(%q<rspec-activemodel-mocks>, [">= 0"])
    s.add_dependency(%q<rspec-collection_matchers>, [">= 0"])
    s.add_dependency(%q<jettywrapper>, [">= 0"])
    s.add_dependency(%q<engine_cart>, ["~> 0.6"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<poltergeist>, [">= 1.5.0"])
  end
end
