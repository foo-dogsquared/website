# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'
require 'open-uri/cached'

require_relative 'helpers'

require_relative 'man-inline-macro/extension'
require_relative 'swhid-inline-macro/extension'
require_relative 'swhid-include-processor/extension'
require_relative 'github-link-inline-macro/extension'
require_relative 'github-raw-content-include-processor/extension'
require_relative 'gitlab-link-inline-macro/extension'
require_relative 'gitlab-raw-content-include-processor/extension'
require_relative 'chat-block-processor/extension'
require_relative 'git-blob-include-processor/extension'
require_relative 'wikipedia-inline-macro/extension'
require_relative 'package-indices-link-macro/extension'
require_relative 'fdroid-link-inline-macro/extension'
require_relative 'musicbrainz-link-inline-macro/extension'
require_relative 'flathub-link-inline-macro/extension'
require_relative 'repology-link-inline-macro/extension'
require_relative 'ietf-rfc-link-inline-macro/extension'

OpenURI::Cache.cache_path = '/tmp/open-uri-cache-foodogsquared-website'

Asciidoctor::Extensions.register do
  inline_macro ManInlineMacro
  inline_macro IETFRFCLinkInlineMacro
  block ChatBlock if @document.basebackend? 'html'

  inline_macro SWHInlineMacro
  include_processor SWHIDIncludeProcessor

  inline_macro GitHubLinkInlineMacro
  include_processor GitHubRawIncludeProcessor

  inline_macro GitLabLinkInlineMacro
  include_processor GitLabRawIncludeProcessor

  include_processor GitBlobIncludeProcessor
  preprocessor GitContentBranchAttributePreprocessor

  inline_macro WikipediaInlineMacro

  # Package indices
  inline_macro CtanLinkInlineMacro
  inline_macro PypiLinkInlineMacro
  inline_macro CratesIOLinkInlineMacro

  # App stores
  inline_macro FDroidLinkInlineMacro
  inline_macro FlathubLinkInlineMacro

  # Databases
  inline_macro MusicBrainzLinkInlineMacro
  inline_macro RepologyLinkInlineMacro
end
