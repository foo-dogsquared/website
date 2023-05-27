# frozen_string_literal: true

class RepologyLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :repology
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document
    text = attrs['caption'] || target
    url = %(https://repology.org/project/#{target})

    doc.register :links, url

    create_anchor parent, text, type: :link, target: url
  end
end
