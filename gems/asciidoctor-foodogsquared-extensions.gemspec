Gem::Specification.new do |s|
  s.name          = 'asciidoctor-foodogsquared-extensions'
  s.version       = '1.0.0'
  s.licenses      = ['MIT']
  s.summary       = "foo-dogsquared's custom Asciidoctor extensions"
  s.description   = <<-DESC
    foo-dogsquared's custom Asciidoctor extensions as a Gem. This is not meant
    to be used in production or as a public Gem. This is used since Hugo
    doesn't allow loading Asciidoctor extensions with path separators.
  DESC

  s.authors       = ['Gabriel Arazas']
  s.email         = 'foodogsquared@foodogsquared.one'
  s.metadata      = { 'source_code_uri' => 'https://github.com/foo-dogsquared/foo-dogsquared.github.io' }

  s.files         = Dir['lib/**/*', '*.gemspec']

  s.add_runtime_dependency 'asciidoctor', '~> 2.0'
  s.add_runtime_dependency 'open-uri-cached', '~> 1.0'
end
