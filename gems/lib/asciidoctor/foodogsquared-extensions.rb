require 'asciidoctor'
require 'asciidoctor/extensions'
require_relative 'man-inline-macro/extension'
require_relative 'swhid-inline-macro/extension'
require_relative 'github-raw-content-include-processor/extension'

Asciidoctor::Extensions.register do
  inline_macro ManInlineMacro
  inline_macro SWHInlineMacro
  include_processor GitHubRawIncludeProcessor
end
