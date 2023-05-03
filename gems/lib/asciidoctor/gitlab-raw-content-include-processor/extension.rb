# frozen_string_literal: true

require 'base64'
require 'json'
require 'open-uri'
require 'open-uri/cached'
require 'uri'

class GitLabRawIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
  def handles?(target)
    target.start_with? 'gitlab:'
  end

  def warn_or_raise(doc, warning)
    if (doc.safe > Asciidoctor::SafeMode::SERVER) && !(doc.attr? 'allow-uri-read')
      raise warning
    else
      warn warning
    end
  end

  def process(doc, reader, target, attrs)
    src = target.delete_prefix('gitlab:').split('/', 2)
    owner = src.at 0
    repo = src.at 1
    namespaced_repo = "#{owner}/#{repo}"

    raise %(there is no 'path' attribute given for GitLab repo '#{namespaced_repo}') unless attrs.key? 'path'
    raise %(no given ref for getting file in '#{namespaced_repo}') unless attrs.key? 'rev'

    path = attrs['path']
    rev = attrs['rev']

    domain = attrs['domain'] || 'gitlab.com'
    version = attrs['version'] || 'v4'

    uri = URI.parse %(https://#{domain}/api/#{version})

    # Set the project.
    uri += %(/projects/#{URI.encode_www_form_component namespaced_repo})

    # Then the filename.
    uri += %(/repository/files/#{URI.encode_www_form_component path})

    # Then the revision.
    query = { ref: rev }
    uri.query = URI.encode_www_form query

    content = begin
      headers = { 'Content-Type' => 'application-json' }
      header['PRIVATE-TOKEN'] = ENV['GITLAB_API_PERSONAL_ACCESS_TOKEN'] if ENV['GITLAB_API_PERSONAL_ACCESS_TOKEN']

      OpenURI.open_uri(uri, headers) do |f|
        response = JSON.parse(f.read)

        Base64.decode64 response['content'] if response['content'] && response['encoding'] == 'base64'
      end
    rescue OpenURI::HTTPError => e
      warning = %(error while getting '#{path}' in GitLab repo '#{repo}': #{e})
      warn_or_raise doc, warning
      warning
    end

    reader.push_include content, target, target, 1, attrs
    reader
  end
end
