# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

require_relative './asciidoctor/custom_extensions/chat_block_processor'

Asciidoctor::Extensions.register do
  block ChatBlock if @document.basebackend? 'html'
end
