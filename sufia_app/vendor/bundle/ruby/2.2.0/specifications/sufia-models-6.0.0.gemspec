# -*- encoding: utf-8 -*-
# stub: sufia-models 6.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sufia-models"
  s.version = "6.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jeremy Friesen"]
  s.date = "2015-03-27"
  s.description = "Models and services for sufia"
  s.email = ["jeremy.n.friesen@gmail.com"]
  s.homepage = "https://github.com/projecthydra/sufia"
  s.licenses = ["Apache2"]
  s.rubygems_version = "2.4.5"
  s.summary = "Models and services for sufia"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, ["~> 10.3"])
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_runtime_dependency(%q<activeresource>, ["~> 4.0"])
      s.add_runtime_dependency(%q<hydra-head>, ["~> 9.0"])
      s.add_runtime_dependency(%q<active-fedora>, ["~> 9.0"])
      s.add_runtime_dependency(%q<hydra-collections>, ["< 6.0", ">= 5.0.2"])
      s.add_runtime_dependency(%q<hydra-derivatives>, ["~> 1.0"])
      s.add_runtime_dependency(%q<nest>, ["~> 1.1"])
      s.add_runtime_dependency(%q<resque>, ["~> 1.23"])
      s.add_runtime_dependency(%q<resque-pool>, ["~> 0.3"])
      s.add_runtime_dependency(%q<noid>, ["~> 0.6"])
      s.add_runtime_dependency(%q<mailboxer>, ["~> 0.12"])
      s.add_runtime_dependency(%q<acts_as_follower>, ["< 0.3", ">= 0.1.1"])
      s.add_runtime_dependency(%q<carrierwave>, ["~> 0.9"])
      s.add_runtime_dependency(%q<oauth2>, ["~> 0.9"])
      s.add_runtime_dependency(%q<google-api-client>, ["~> 0.7"])
      s.add_runtime_dependency(%q<legato>, ["~> 0.3"])
      s.add_runtime_dependency(%q<activerecord-import>, ["~> 0.5"])
      s.add_runtime_dependency(%q<mini_magick>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, ["~> 10.3"])
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<activeresource>, ["~> 4.0"])
      s.add_dependency(%q<hydra-head>, ["~> 9.0"])
      s.add_dependency(%q<active-fedora>, ["~> 9.0"])
      s.add_dependency(%q<hydra-collections>, ["< 6.0", ">= 5.0.2"])
      s.add_dependency(%q<hydra-derivatives>, ["~> 1.0"])
      s.add_dependency(%q<nest>, ["~> 1.1"])
      s.add_dependency(%q<resque>, ["~> 1.23"])
      s.add_dependency(%q<resque-pool>, ["~> 0.3"])
      s.add_dependency(%q<noid>, ["~> 0.6"])
      s.add_dependency(%q<mailboxer>, ["~> 0.12"])
      s.add_dependency(%q<acts_as_follower>, ["< 0.3", ">= 0.1.1"])
      s.add_dependency(%q<carrierwave>, ["~> 0.9"])
      s.add_dependency(%q<oauth2>, ["~> 0.9"])
      s.add_dependency(%q<google-api-client>, ["~> 0.7"])
      s.add_dependency(%q<legato>, ["~> 0.3"])
      s.add_dependency(%q<activerecord-import>, ["~> 0.5"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, ["~> 10.3"])
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<activeresource>, ["~> 4.0"])
    s.add_dependency(%q<hydra-head>, ["~> 9.0"])
    s.add_dependency(%q<active-fedora>, ["~> 9.0"])
    s.add_dependency(%q<hydra-collections>, ["< 6.0", ">= 5.0.2"])
    s.add_dependency(%q<hydra-derivatives>, ["~> 1.0"])
    s.add_dependency(%q<nest>, ["~> 1.1"])
    s.add_dependency(%q<resque>, ["~> 1.23"])
    s.add_dependency(%q<resque-pool>, ["~> 0.3"])
    s.add_dependency(%q<noid>, ["~> 0.6"])
    s.add_dependency(%q<mailboxer>, ["~> 0.12"])
    s.add_dependency(%q<acts_as_follower>, ["< 0.3", ">= 0.1.1"])
    s.add_dependency(%q<carrierwave>, ["~> 0.9"])
    s.add_dependency(%q<oauth2>, ["~> 0.9"])
    s.add_dependency(%q<google-api-client>, ["~> 0.7"])
    s.add_dependency(%q<legato>, ["~> 0.3"])
    s.add_dependency(%q<activerecord-import>, ["~> 0.5"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
  end
end
