Gem::Specification.new do |s|
  s.name        = 'price_app'
  s.version     = '1.0.0'
  s.date        = '2023-05-02'
  s.summary     = 'Summary'
  s.description = 'Description'
  s.authors     = ['Arthur Ferraz']
  s.email       = 'arthur.ferraz07@hotmail.com'
  s.files       = Dir['{app,config,db,lib}/**/*', 'README.md', 'Rakefile', 'price_app.gemspec']
  s.require_paths = ['app', 'lib']
  s.add_dependency 'rails', '~> 7.0.4'
  s.add_dependency 'dotenv-rails'
end
