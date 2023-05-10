Gem::Specification.new do |s|
  s.name          = 'asciidoctor-custom-extensions'
  s.version       = '1.0.0'
  s.licenses      = ['MIT']
  s.summary       = 'My custom Asciidoctor extensions'
  s.authors       = ['Yor Neighme']
  s.email         = 'yor.neighme@example.com'
  s.metadata      = {
    'bug_tracker_uri' => 'https://example.com/yoruserneighme/website/issues',
    'source_code_uri' => 'https://example.com/yoruserneighme/website.git'
  }

  s.files = Dir['*.gemspec', 'lib/**/*']
  s.required_ruby_version = '>= 2.6'
  s.add_runtime_dependency 'asciidoctor', '~> 2.0'
end
