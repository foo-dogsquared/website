# frozen_string_literal: true

# I'm fairly sure this could be programmed since Ruby has nice metaprogramming
# capabilities. Though, we'll be keeping it manually defining classes for now
# for initial versions since there could be additional features for each macro.

class CtanLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :ctan
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document
    text = attrs['caption'] || target
    url = %(https://ctan.org/pkg/#{target})

    doc.register :links, url

    create_anchor parent, text, type: :link, target: url
  end
end

class PypiLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :pypi
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document
    text = attrs['caption'] || target
    url = %(https://pypi.org/project/#{target})

    doc.register :links, url

    create_anchor parent, text, type: :link, target: url
  end
end

class CratesIOLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :cratesio
  name_positional_attributes 'caption'

  def process(parent, target, attrs)
    doc = parent.document
    text = attrs['caption'] || target
    url = %(https://crates.io/crates/#{target})

    doc.register :links, url

    create_anchor parent, text, type: :link, target: url
  end
end
