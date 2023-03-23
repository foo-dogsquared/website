# frozen_string_literal: true

class ManInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :man
  name_positional_attributes 'volnum'
  default_attributes 'service' => 'debian'

  def process(parent, target, attrs)
    doc = parent.document
    text = manname = target
    suffix = (volnum = attrs['volnum']) ? %((#{volnum})) : ''

    if doc.basebackend? 'html'
      case attrs['service']
      when 'debian'
        domain = 'https://manpages.debian.org'
      when 'arch'
        domain = 'https://man.archlinux.org/man'
      when 'opensuse'
        domain = 'https://manpages.opensuse.org'
      when 'voidlinux'
        domain = 'https://man.voidlinux.org'
      else
        raise "no available manpage service #{attrs['service']}"
      end

      target = %(#{domain}/#{manname}.#{volnum})
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
