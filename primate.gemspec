Gem::Specification.new do |s|
  s.name        = "primate"
  s.version     = "0.0.1"
  s.date        = "2012-03-16"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Foy Savas"]
  s.email       = "foy@sav.as"
  s.homepage    = "http://github.com/foysavas/primate"
  s.summary     = %q{Primate lets you describe and mockup APIs.}
  s.description = %q{...}
  s.files       = %w( Rakefile ) 
  s.files      += Dir.glob("lib/**/*")
  s.files      += Dir.glob("bin/**/*")

  s.add_runtime_dependency 'rack'
  s.add_runtime_dependency 'http_router'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-mocks'

  s.executables = %w( primate )
  s.require_paths = ["lib"]
end
