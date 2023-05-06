# frozen_string_literal: true

class SWHInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :swh
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document

    # We're only considering `swh:` starting with the scheme version. Also, it
    # looks nice aesthetically.
    swhid = target.start_with?('swh:') ? target : %(swh:#{target})
    default_caption = if attrs.key? 'full-option'
                        swhid
                      else
                        swhid.split(';').at(0)
                      end
    text = attrs['caption'] || default_caption
    target = %(https://archive.softwareheritage.org/#{swhid})

    doc.register :links, target
    create_anchor parent, text, type: :link, target: target
  end
end
