# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

require_relative './asciidoctor/custom_extensions/swhid_link_inline_macro'

Asciidoctor::Extensions.register do
  inline_macro SWHInlineMacro
end
