# frozen_string_literal: true

class ChatBlock < Asciidoctor::Extensions::BlockProcessor
  use_dsl

  named :chat
  on_context :example
  name_positional_attributes 'avatar', 'state'
  default_attributes 'state' => 'default', 'avatarstype' => 'webp'

  # TODO: Create the output.
  def process(parent, reader, attrs)
  end
end
