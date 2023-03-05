require 'base64'
require 'json'
require 'open-uri'
require 'uri'

class GitHubRawIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
  def handles? target
    target.start_with? 'github:'
  end

  def warn_or_raise doc, warning
    if (doc.safe > Asciidoctor::SafeMode::SERVER) && !(doc.attr? 'allow-uri-read')
      raise warning
    else
      warn warning
    end
  end

  def process doc, reader, target, attrs
    src = target.delete_prefix('github:').split('/', 3)
    owner = src.at 0
    repo = src.at 1
    namespaced_repo = "#{owner}/#{repo}"

    path = attrs['path'] || ''

    # For more information, see https://docs.github.com/en/rest/repos/contents.
    uri = URI.parse %(https://api.github.com/repos/#{owner}/#{repo}/contents/#{path})

    if attrs['rev']
      query = { :ref => attrs['rev'] }
      uri.query = URI.encode_www_form query
    end

    begin
      OpenURI.open_uri(
        uri,
        'Header' => 'application/vnd.github+json',
        'X-GitHub-Api-Version' => '2022-11-28'
      ) do |f|
        response = JSON.parse(f.read)

        # If the response is an array, it is likely to be a directory. In this
        # usecase, we'll just list them.
        content = if response.kind_of? Array
          warning = %(given path '#{path}' from GitHub repo '#{repo}' is a directory)
          warn_or_raise doc, warning
          warning
        elsif response.kind_of? Object
          if response['content'] && response['encoding'] == 'base64'
            Base64.decode64 response['content']
          end
        end

        reader.push_include content, target, target, 1, attrs
      end
    rescue OpenURI::HTTPError => e
      warning = %(error while getting '#{path}' in GitHub repo '#{repo}: #{e}')
      warn_or_raise doc, warning
      reader.push_include warning, target, target, 1, attrs
    end

    reader
  end
end
