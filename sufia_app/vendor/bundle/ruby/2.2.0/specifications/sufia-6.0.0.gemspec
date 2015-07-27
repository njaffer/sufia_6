# -*- encoding: utf-8 -*-
# stub: sufia 6.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sufia"
  s.version = "6.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Justin Coyne", "Michael J. Giarlo"]
  s.date = "2015-03-27"
  s.description = "Sufia is a Rails engine for creating a self-deposit institutional repository"
  s.email = ["justin@curationexperts.com", "leftwing@alumni.rutgers.edu"]
  s.executables = ["audit_repository"]
  s.files = ["bin/audit_repository"]
  s.homepage = "http://github.com/projecthydra/sufia"
  s.licenses = ["Apache2"]
  s.rubygems_version = "2.4.5"
  s.summary = "Sufia was extracted from ScholarSphere developed by Penn State University"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sufia-models>, ["= 6.0.0"])
      s.add_runtime_dependency(%q<blacklight_advanced_search>, ["< 6.0", ">= 5.1.4"])
      s.add_runtime_dependency(%q<blacklight>, ["~> 5.12"])
      s.add_runtime_dependency(%q<tinymce-rails>, ["~> 4.0.19"])
      s.add_runtime_dependency(%q<tinymce-rails-imageupload>, ["~> 4.0.16.beta"])
      s.add_runtime_dependency(%q<sass-rails>, [">= 0"])
      s.add_runtime_dependency(%q<hydra-batch-edit>, ["~> 1.1"])
      s.add_runtime_dependency(%q<browse-everything>, ["~> 0.4"])
      s.add_runtime_dependency(%q<daemons>, ["~> 1.1"])
      s.add_runtime_dependency(%q<mail_form>, ["~> 1.5"])
      s.add_runtime_dependency(%q<rails_autolink>, ["~> 1.1"])
      s.add_runtime_dependency(%q<yaml_db>, ["~> 0.2"])
      s.add_runtime_dependency(%q<font-awesome-rails>, ["~> 4.2"])
      s.add_runtime_dependency(%q<hydra-editor>, ["~> 1.0"])
      s.add_runtime_dependency(%q<blacklight-gallery>, ["~> 0.1"])
      s.add_runtime_dependency(%q<breadcrumbs_on_rails>, ["~> 2.3.0"])
      s.add_runtime_dependency(%q<select2-rails>, ["~> 3.5.9"])
      s.add_runtime_dependency(%q<devise>, ["~> 3.0"])
      s.add_development_dependency(%q<engine_cart>, ["~> 0.5"])
      s.add_development_dependency(%q<mida>, ["~> 0.3"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 1.3"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec-activemodel-mocks>, ["~> 1.0"])
      s.add_development_dependency(%q<capybara>, ["~> 2.4"])
      s.add_development_dependency(%q<poltergeist>, ["~> 1.5"])
      s.add_development_dependency(%q<factory_girl_rails>, ["~> 4.4"])
      s.add_development_dependency(%q<equivalent-xml>, ["~> 0.5"])
    else
      s.add_dependency(%q<sufia-models>, ["= 6.0.0"])
      s.add_dependency(%q<blacklight_advanced_search>, ["< 6.0", ">= 5.1.4"])
      s.add_dependency(%q<blacklight>, ["~> 5.12"])
      s.add_dependency(%q<tinymce-rails>, ["~> 4.0.19"])
      s.add_dependency(%q<tinymce-rails-imageupload>, ["~> 4.0.16.beta"])
      s.add_dependency(%q<sass-rails>, [">= 0"])
      s.add_dependency(%q<hydra-batch-edit>, ["~> 1.1"])
      s.add_dependency(%q<browse-everything>, ["~> 0.4"])
      s.add_dependency(%q<daemons>, ["~> 1.1"])
      s.add_dependency(%q<mail_form>, ["~> 1.5"])
      s.add_dependency(%q<rails_autolink>, ["~> 1.1"])
      s.add_dependency(%q<yaml_db>, ["~> 0.2"])
      s.add_dependency(%q<font-awesome-rails>, ["~> 4.2"])
      s.add_dependency(%q<hydra-editor>, ["~> 1.0"])
      s.add_dependency(%q<blacklight-gallery>, ["~> 0.1"])
      s.add_dependency(%q<breadcrumbs_on_rails>, ["~> 2.3.0"])
      s.add_dependency(%q<select2-rails>, ["~> 3.5.9"])
      s.add_dependency(%q<devise>, ["~> 3.0"])
      s.add_dependency(%q<engine_cart>, ["~> 0.5"])
      s.add_dependency(%q<mida>, ["~> 0.3"])
      s.add_dependency(%q<database_cleaner>, ["~> 1.3"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
      s.add_dependency(%q<rspec-its>, ["~> 1.1"])
      s.add_dependency(%q<rspec-activemodel-mocks>, ["~> 1.0"])
      s.add_dependency(%q<capybara>, ["~> 2.4"])
      s.add_dependency(%q<poltergeist>, ["~> 1.5"])
      s.add_dependency(%q<factory_girl_rails>, ["~> 4.4"])
      s.add_dependency(%q<equivalent-xml>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<sufia-models>, ["= 6.0.0"])
    s.add_dependency(%q<blacklight_advanced_search>, ["< 6.0", ">= 5.1.4"])
    s.add_dependency(%q<blacklight>, ["~> 5.12"])
    s.add_dependency(%q<tinymce-rails>, ["~> 4.0.19"])
    s.add_dependency(%q<tinymce-rails-imageupload>, ["~> 4.0.16.beta"])
    s.add_dependency(%q<sass-rails>, [">= 0"])
    s.add_dependency(%q<hydra-batch-edit>, ["~> 1.1"])
    s.add_dependency(%q<browse-everything>, ["~> 0.4"])
    s.add_dependency(%q<daemons>, ["~> 1.1"])
    s.add_dependency(%q<mail_form>, ["~> 1.5"])
    s.add_dependency(%q<rails_autolink>, ["~> 1.1"])
    s.add_dependency(%q<yaml_db>, ["~> 0.2"])
    s.add_dependency(%q<font-awesome-rails>, ["~> 4.2"])
    s.add_dependency(%q<hydra-editor>, ["~> 1.0"])
    s.add_dependency(%q<blacklight-gallery>, ["~> 0.1"])
    s.add_dependency(%q<breadcrumbs_on_rails>, ["~> 2.3.0"])
    s.add_dependency(%q<select2-rails>, ["~> 3.5.9"])
    s.add_dependency(%q<devise>, ["~> 3.0"])
    s.add_dependency(%q<engine_cart>, ["~> 0.5"])
    s.add_dependency(%q<mida>, ["~> 0.3"])
    s.add_dependency(%q<database_cleaner>, ["~> 1.3"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.1"])
    s.add_dependency(%q<rspec-its>, ["~> 1.1"])
    s.add_dependency(%q<rspec-activemodel-mocks>, ["~> 1.0"])
    s.add_dependency(%q<capybara>, ["~> 2.4"])
    s.add_dependency(%q<poltergeist>, ["~> 1.5"])
    s.add_dependency(%q<factory_girl_rails>, ["~> 4.4"])
    s.add_dependency(%q<equivalent-xml>, ["~> 0.5"])
  end
end
