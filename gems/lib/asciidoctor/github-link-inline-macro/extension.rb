# frozen_string_literal: true

require 'uri'

class GitHubLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :github
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document

    text = attrs['caption'] || target
    uri = URI.parse %(https://github.com/#{target})

    if attrs.key? 'issue'
      uri.path += %(/issues/#{attrs['issue']})
    else
      uri.path += %(/tree/#{attrs['rev']}) if attrs.key? 'rev'
      uri.path += %(/#{attrs['path']}) if attrs.key? 'path'
    end

    target = uri.to_s

    doc.register :links, target
    create_anchor parent, text, type: :link, target: target
  end
end
