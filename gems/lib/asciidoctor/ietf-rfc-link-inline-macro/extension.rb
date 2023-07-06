# frozen_string_literal: true

class IETFRFCLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :rfc
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document
    url = %(https://datatracker.ietf.org/doc/html/#{target})
    attrs['caption'] ||= "RFC#{target}"
    doc.register :links, url
    create_anchor parent, attrs['caption'], type: :link, target: url
  end
end
