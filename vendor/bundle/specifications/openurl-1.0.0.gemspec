# -*- encoding: utf-8 -*-
# stub: openurl 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "openurl"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jonathan Rochkind", "Ross Singer"]
  s.date = "2014-07-16"
  s.email = ["rochkind@jhu.edu", "rossfsinger@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "https://github.com/openurl/openurl"
  s.rubygems_version = "2.2.2"
  s.summary = "a Ruby library to create, parse and use NISO Z39.88 OpenURLs"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<marc>, [">= 0"])
      s.add_runtime_dependency(%q<scrub_rb>, ["~> 1.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<marc>, [">= 0"])
      s.add_dependency(%q<scrub_rb>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<marc>, [">= 0"])
    s.add_dependency(%q<scrub_rb>, ["~> 1.0"])
  end
end
