# -*- encoding: utf-8 -*-
# stub: hydra-role-management 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-role-management"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Justin Coyne"]
  s.date = "2014-12-18"
  s.description = "Rails engine to do user roles in an RDBMS for hydra-head"
  s.email = ["justin@curationexperts.com"]
  s.homepage = "https://github.com/projecthydra/hydra-role-management"
  s.rubygems_version = "2.4.5"
  s.summary = "Rails engine to do user roles in an RDBMS for hydra-head"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bootstrap_form>, [">= 0"])
      s.add_runtime_dependency(%q<blacklight>, [">= 0"])
      s.add_runtime_dependency(%q<cancancan>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<rspec-its>, [">= 0"])
      s.add_development_dependency(%q<engine_cart>, [">= 0"])
    else
      s.add_dependency(%q<bootstrap_form>, [">= 0"])
      s.add_dependency(%q<blacklight>, [">= 0"])
      s.add_dependency(%q<cancancan>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<rspec-its>, [">= 0"])
      s.add_dependency(%q<engine_cart>, [">= 0"])
    end
  else
    s.add_dependency(%q<bootstrap_form>, [">= 0"])
    s.add_dependency(%q<blacklight>, [">= 0"])
    s.add_dependency(%q<cancancan>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<rspec-its>, [">= 0"])
    s.add_dependency(%q<engine_cart>, [">= 0"])
  end
end
