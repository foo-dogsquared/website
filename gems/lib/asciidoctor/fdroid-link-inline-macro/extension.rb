# frozen_string_literal: true

require 'open-uri'
require 'open-uri/cached'
require 'yaml'

class FDroidLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :fdroid
  name_positional_attributes 'caption'
  default_attributes 'lang' => 'en'

  def process(parent, target, attrs)
    doc = parent.document

    app_id = target
    app_metadata_uri = %(https://gitlab.com/fdroid/fdroiddata/-/raw/master/metadata/#{app_id}.yml)

    if attrs['caption'].nil?
      metadata = OpenURI.open_uri(app_metadata_uri) { |f| YAML.safe_load(f.read) }
      attrs['caption'] = metadata['AutoName']
    end

    url = %(https://f-droid.org/#{attrs['lang']}/packages/#{app_id})
    doc.register :links, url
    create_anchor parent, attrs['caption'], type: :link, target: url
  end
end
