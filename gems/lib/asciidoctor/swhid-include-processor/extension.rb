# frozen_string_literal: true

require 'json'
require 'open-uri'
require 'uri'

class SWHIDIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
  def handles?(target)
    target.start_with? 'swh:'
  end

  def process(doc, reader, target, attributes)
    swhid = target
    swhid_core_identifier = swhid.split(';').at(0)
    swhid_object_type = (swhid_core_identifier.split ':').at 2

    unless (doc.safe <= Asciidoctor::SafeMode::SERVER) && (doc.attr? 'allow-uri-read')
      raise %('swh:' include cannot be used in safe mode level > SERVER and without attribute 'allow-uri-read')
    end

    # We're already going to throw out anything that is not content object type
    # just to make the later pipelines easier to construct.
    if swhid_object_type != 'cnt'
      warn %(SWHID '#{swhid_core_identifier}' is not of 'cnt' type; ignoring)
      return reader
    end

    version = '1'

    content = begin
      uri = URI.parse %(https://archive.softwareheritage.org/api/#{version}/resolve/#{target}/)

      headers = {
        'Accept' => 'application/json'
      }

      headers['Authorization'] = "Bearer #{ENV['SWH_API_BEARER_TOKEN']}" if ENV['SWH_API_BEARER_TOKEN']

      metadata = OpenURI.open_uri(uri, headers) { |f| JSON.parse(f.read) }
      object_hash = metadata['object_id']

      uri = URI.parse %(https://archive.softwareheritage.org/api/#{version}/content/sha1_git:#{object_hash}/raw/)
      OpenURI.open_uri(uri, headers, &:read)
    rescue OpenURI::HTTPError => e
      warning = %(error while getting '#{swhid_core_identifier}': #{e})
      warn warning
      warning
    end

    reader.push_include content, target, target, 1, attributes
    reader
  end
end
