# frozen_string_literal: true

class ChatBlock < Asciidoctor::Extensions::BlockProcessor
  use_dsl

  named :chat
  on_context :example
  name_positional_attributes 'avatar', 'state'
  default_attributes 'state' => 'default', 'avatarstype' => 'webp'

  def process(parent, reader, attrs)
    block = create_block parent, :pass, nil, attrs, content_model: :compound
    block.add_role('dialogblock')

    attrs['name'] ||= attrs['avatar']
    attrs['avatarsdir'] ||= './avatars'

    # You can think of this section as a pipeline constructing the HTML
    # component for this block. Specifically, we're building one component that
    # contains two output: the dialog image of our avatar and its content.
    block << (create_block block, :pass, %(
      <div class="dialogblock dialogblock__box dialogblock__avatar--#{attrs['avatar']} #{attrs['role']}" title="#{attrs['avatar']}">
        <div class="dialogblock dialogblock__avatar">
    ), nil)

    # TODO: Create the image block here

    block << (create_block block, :pass, %(
        </div>
        <div class="dialogblock dialogblock__text">
    ), nil)

    # TODO: Insert the content.

    block << (create_block block, :pass, %(
        </div>
      </div>
    ), nil)

    block
  end
end
