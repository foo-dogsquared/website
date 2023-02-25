require 'asciidoctor'
require 'asciidoctor/extensions'
require_relative 'man-inline-macro/extension'

Asciidoctor::Extensions.register do
  inline_macro ManInlineMacro
end
