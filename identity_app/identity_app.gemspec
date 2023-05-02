Gem::Specification.new do |s|
  s.name        = 'identity_app'
  s.version     = '1.0.0'
  s.date        = '2021-05-02'
  s.summary     = 'Summary'
  s.description = 'Description'
  s.authors     = ['Arthur Ferraz']
  s.email       = 'arthur.ferraz07@hotmail.com'
  s.files       = Dir['{app,config,db,lib}/**/*', 'README.md', 'Rakefile', 'your_app_name.gemspec']
  s.require_paths = ['app', 'lib']
  s.add_dependency 'rails', '~> 7.0.4'
  s.add_dependency 'dotenv-rails'
  s.add_dependency 'awesome_print'
  s.add_dependency 'bcrypt'
end
