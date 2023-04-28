require_relative "lib/identity_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "identity_engine"
  spec.version     = IdentityEngine::VERSION
  spec.authors     = ["Arthur Ferraz"]
  spec.email       = ["arthur.ferraz07@hotmail.com"]
  spec.homepage    = "https://github.com/ArthurFerraz07/almost-rails-monorepo"
  spec.summary     = "Summary of IdentityEngine."
  spec.description = "Description of IdentityEngine."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4.3"
end
