# frozen_string_literal: true

class ManInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :man
  name_positional_attributes 'volnum'
  default_attributes 'domain' => 'manpages.debian.org'

  def process(parent, target, attrs)
    doc = parent.document
    text = manname = target
    suffix = (volnum = attrs['volnum']) ? %((#{volnum})) : ''

    if doc.basebackend? 'html'
      target = %(https://#{attrs['domain']}/#{manname}.#{volnum})
      doc.register :links, target
      node = create_anchor parent, text, type: :link, target: target
    elsif doc.backend == 'manpage'
      node = create_inline parent, :quoted, manname, type: :strong
    else
      node = create_inline parent, :quoted, manname
    end
    create_inline parent, :quoted, %(#{node.convert}#{suffix})
  end
end
