require 'uri'

class GitLabLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :gitlab
  name_positional_attributes 'caption'
  default_attributes 'domain' => 'gitlab.com'

  def process parent, target, attrs
    doc = parent.document

    text = attrs['caption'] || target
    uri = URI.parse %(https://#{attrs['domain']}/#{target})

    uri.path += %(/-/tree/#{attrs['rev']}) if attrs['rev']
    uri.path += %(/#{attrs['path']}) if attrs['path']

    target = uri.to_s

    doc.register :links, target
    create_anchor parent, text, type: :link, target: target
  end
end
