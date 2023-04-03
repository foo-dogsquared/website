# frozen_string_literal: true

def to_kebab_case string
  string.gsub(/\s+/, '-')           # Replace all spaces with dashes.
        .gsub(/[^a-zA-Z0-9-]/, '')  # Remove all non-alphanumerical (and dashes) characters.
        .gsub(/-+/, '-')            # Reduce all dashes into only one.
        .gsub(/^-|-+$/, '')         # Remove all leading and trailing dashes.
        .downcase
end

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

    avatar_sticker = "#{to_kebab_case attrs['avatar']}/#{to_kebab_case attrs['state']}.#{attrs['avatarstype']}"
    avatar_img_attrs = {
      'target' => parent.image_uri(avatar_sticker, 'avatarsdir'),
      'alt' => attrs['name']
    }
    block << (create_image_block block, avatar_img_attrs)

    block << (create_block block, :pass, %(
        </div>
        <div class="dialogblock dialogblock__text">
    ), nil)

    parse_content block, reader

    block << (create_block block, :pass, %(
        </div>
      </div>
    ), nil)

    block
  end
end
