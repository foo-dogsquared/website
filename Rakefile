# frozen_string_literal: true

require 'json'
require 'open3'
require 'shellwords'

github_api_headers = {
  'Header' => 'application/vnd.github+json',
  'X-GitHub-Api-Version' => '2022-11-28'
}
github_api_headers['Authorization'] = "Token #{ENV['GITHUB_API_BEARER_TOKEN']}" if ENV['GITHUB_API_BEARER_TOKEN']

desc 'Build the site in Netlify with the given context'
task :build, [:context, :base_url] do |_, args|
  args.with_defaults(context: 'production')
  draft_args = '--environment development --buildDrafts --buildFuture --buildExpired' unless args.context == 'production'
  base_uri_args = "-b #{args.base_url}" if args.base_url

  # Unfortunately, we have to pass it inside of another Nix shell since
  # Asciidoctor doesn't want to be found when executed in here for whatever
  # reason.
  sh "nix develop -c hugo #{draft_args} #{base_uri_args} --destination public"
end

desc 'Build the webring to be embedded with the site'
task :build_webring, [:limit, :input, :output, :file] do |_, args|
  args.with_defaults(
    limit: 5,
    file: './data/blogs.json',
    input: './assets/templates/openring-input.html',
    output: './layouts/partials/openring.html'
  )

  File.open args.file do |f|
    feeds = JSON.parse(f.read).sample(args.limit)
    feeds.map! { |feed| "-s #{Shellwords.escape(feed)}" }

    command = ['openring', '-n', args.limit.to_s]
    command.append(*feeds)

    Open3.pipeline command.join(' '), in: args.input, out: args.output
  end
end

desc 'Create a web server'
task :serve do
  sh 'nix develop -c hugo serve --buildFuture --verboseLog --destination public'
end

desc 'Update the Hugo modules for this project'
task :update do
  sh 'hugo mod get ./... && hugo mod tidy'
end
