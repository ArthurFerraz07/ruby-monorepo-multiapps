Gem::Specification.new do |s|
  s.name        = 'santa_cruz_auth'
  s.version     = '1.0.0'
  s.date        = '2023-05-11'
  s.summary     = 'Summary'
  s.description = 'Description'
  s.authors     = ['Arthur Ferraz']
  s.email       = 'arthur.ferraz07@hotmail.com'
  s.files       = Dir['{lib}/**/*', 'README.md', 'santa_cruz_auth.gemspec']
  s.require_paths = ['lib']
  s.add_dependency 'santa_cruz'
  s.add_dependency 'jwt'
  s.add_dependency 'activesupport'
  s.add_dependency 'httparty'
end
