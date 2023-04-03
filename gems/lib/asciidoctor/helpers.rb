# frozen_string_literal: true

# Code copied from https://gist.github.com/komasaru/b3f22d5bcb8555deea1707b84d294045.
class String
  def to_snake
    self.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .downcase
  end
end
