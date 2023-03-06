require 'asciidoctor'
require 'asciidoctor/extensions'
require_relative 'man-inline-macro/extension'
require_relative 'swhid-inline-macro/extension'
require_relative 'github-link-inline-macro/extension'
require_relative 'github-raw-content-include-processor/extension'
require_relative 'gitlab-raw-content-include-processor/extension'
require_relative 'gitlab-link-inline-macro/extension'

Asciidoctor::Extensions.register do
  inline_macro ManInlineMacro
  inline_macro SWHInlineMacro
  inline_macro GitHubLinkInlineMacro
  include_processor GitHubRawIncludeProcessor
  include_processor GitLabRawIncludeProcessor
  inline_macro GitLabLinkInlineMacro
end
