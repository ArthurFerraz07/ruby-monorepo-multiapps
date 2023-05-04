Gem::Specification.new do |s|
  s.name        = 'santa_cruz'
  s.version     = '1.0.0'
  s.date        = '2023-05-02'
  s.summary     = 'Summary'
  s.description = 'Description'
  s.authors     = ['Arthur Ferraz']
  s.email       = 'arthur.ferraz07@hotmail.com'
  s.files       = Dir['{lib}/**/*', 'README.md', 'santa_cruz.gemspec']
  s.require_paths = ['lib']
  s.add_dependency 'awesome_print'
end
