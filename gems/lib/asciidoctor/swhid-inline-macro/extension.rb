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
    swhid_core_identifier = (swhid.split ';').at 0

    text = attrs['caption'] || swhid_core_identifier
    target = %(https://archive.softwareheritage.org/#{swhid})

    doc.register :links, target
    create_anchor parent, text, type: :link, target: target
  end
end
