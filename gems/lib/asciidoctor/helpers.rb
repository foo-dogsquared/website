# frozen_string_literal: true

class String
  def to_kebab
    self.gsub(/\s+/, '-')           # Replace all spaces with dashes.
        .gsub(/[^a-zA-Z0-9-]/, '')  # Remove all non-alphanumerical (and dashes) characters.
        .gsub(/-+/, '-')            # Reduce all dashes into only one.
        .gsub(/^-|-+$/, '')         # Remove all leading and trailing dashes.
        .downcase
  end
end

module Asciidoctor
  module FoodogsquaredCustomExtensions
    NAME = 'asciidoctor-foodogsquared-custom-extensions'
    VERSION = '1.0.0'
    CONTACT_EMAIL = 'foodogsquared@foodogsquared.one'
    USER_AGENT = "#{NAME}/#{VERSION} ( #{CONTACT_EMAIL} )"
  end
end
