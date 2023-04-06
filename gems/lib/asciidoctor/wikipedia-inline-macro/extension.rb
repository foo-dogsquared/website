# frozen_string_literal: true

require 'uri'

class WikipediaInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :wikipedia
  name_positional_attributes 'caption'
  default_attributes 'lang' => 'en'

  def process(parent, target, attrs)
    caption = attrs['caption'] || target
    page = URI.encode_www_form_component target
    link = %(https://#{attrs['lang']}.wikipedia.org/wiki/#{page})
    node = create_anchor parent, caption, type: :link, target: link

    create_inline parent, :quoted, node.convert
  end
end
