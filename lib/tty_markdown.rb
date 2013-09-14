#! /usr/bin/env ruby

require 'redcarpet'
require './ruby_color'

module Redcarpet
  module Render
    class ColorDown < Base
      COLOR_OFF  = "\033[0m"
      RED        = "\033[0;31m"
      GREEN      = "\033[0;32m"
      YELLOW     = "\033[0;33m"
      BLUE_BG    = "\033[0;44m"
      BOLD       = "\033[0;01m"
      UNDERSCORE = "\033[0;04m"

      # Methods where the first argument is the text content
      [
        # block-level calls
        :block_quote,
        :block_html, :list, :list_item, :paragraph,

        # span-level calls
        :autolink, :codespan, :double_emphasis,
        :emphasis, :underline, :raw_html,
        :triple_emphasis, :strikethrough,
        :superscript,

        # footnotes
        :footnotes, :footnote_def, :footnote_ref,

        # low level rendering
        :entity, :normal_text
      ].each do |method|
        define_method method do |*args|
          args.first
        end
      end

      # Other methods where the text content is in another argument
      #def link(link, title, content)
        #content
      #end
      
      def block_code(text, lang)
        result = "```#{lang}\n"
        if lang == "ruby"
          result << ColorCode::Ruby.new(text).colorize
        else
          result << text
        end
        result << "```\n"
        result
      end

      def emphasis(text)
        [ BOLD,   text, 
          COLOR_OFF, "\n" ].inject("") { |memo, v| memo << v.to_s }
      end

      def header(text, header_level)
        heads = "".tap {|h| header_level.times {h << "#"} }
        heads << " "
        [ BLUE_BG,   heads, text, 
          COLOR_OFF, "\n" ].inject("") { |memo, v| memo << v.to_s }
      end
    end
  end
end
