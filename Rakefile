# frozen_string_literal: true

require 'rake/clean'
require 'concurrent'

require 'fileutils'
require 'json'
require 'open3'
require 'set'
require 'shellwords'

desc 'Build the site'
task :build, %i[context base_url] => %i[clean export_content_assets export_avatars] do |_, args|
  args.with_defaults(context: 'production')
  unless args.context == 'production'
    draft_args = '--environment development --buildDrafts --buildFuture --buildExpired'
  end
  base_uri_args = "-b #{args.base_url}" if args.base_url

  # Unfortunately, we have to pass it inside of another Nix shell since
  # Asciidoctor doesn't want to be found when executed in here for whatever
  # reason.
  sh "nix develop -c hugo #{draft_args} #{base_uri_args} --destination public"
end

desc 'Export the avatar images'
task :export_avatars, %i[base_dir output_dir] do |_, args|
  args.with_defaults(base_dir: './assets/svg/', output_dir: './static/icons')

  output_dirs = Set[]
  sizes = [32, 64, 128, 256, 512, 1024].freeze
  formats = %w[avif webp].freeze

  job_queue = Concurrent::ThreadPoolExecutor.new(min_threads: 5)
  Dir.glob('avatars/**/*.svg', base: args.base_dir) do |f|
    dirname = File.dirname f
    output_dir = %(#{args.output_dir}/#{dirname})

    if output_dirs.add?(output_dir)
      FileUtils.mkdir_p(output_dir, verbose: true)

      sizes.each do |size|
        size_dir = "#{output_dir}/#{size}x#{size}"
        FileUtils.mkdir_p(size_dir, verbose: true)
      end
    end

    # Create the avatars into various sizes.
    formats.product(sizes).each do |metadata|
      format = metadata[0]
      size = metadata[1]
      area = "#{size}x#{size}"

      output_file = "#{output_dir}/#{area}/#{File.basename(f, '.svg')}.#{format}"
      Concurrent::Future.execute(executor: job_queue) do
        sh "magick #{args.base_dir}#{f} -strip -resize #{area} -quality 30 #{output_file}"
      end
    end

    # Make the fallback images.
    formats.each do |format|
      output_file = "#{output_dir}/#{File.basename(f, '.svg')}.#{format}"
      Concurrent::Future.execute(executor: job_queue) do
        sh "magick #{args.base_dir}#{f} -strip -resize 75% -quality 30 #{output_file}"
      end
    end
  end
end

desc 'Export the content assets'
task :export_content_assets do
end

desc 'Build the webring to be embedded with the site'
task :build_webring, %i[limit input output file] do |_, args|
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
  sh 'nix develop -c hugo serve --buildFuture --destination public'
end

desc 'Update the Hugo modules for this project'
task :update do
  sh 'hugo mod get ./... && hugo mod tidy'
end

desc 'Update the flake'
task :flake_update do
  sh 'nix flake update --commit-lock-file --commit-lockfile-summary "Update flake inputs"'
end

desc 'Clean the environment'
task :clean do
  # Remove the generated files.
  generated_files_dir = [
    './public',
    './static/icons',
    './static/posts'
  ]

  generated_files_dir.each do |dir|
    FileUtils.rm_r dir, secure: true if File.exist? dir
  end
end
