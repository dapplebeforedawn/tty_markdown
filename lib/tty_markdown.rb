#! /usr/bin/env ruby

require          'redcarpet'
require_relative './ruby_color'
require_relative './unknown_color'

module Redcarpet
  module Render
    class ColorDown < Base
      UNORDERED  = /unordered/
      RUBY_LANG  = /ruby/

      COLOR_OFF  = "\033[0m"
      WHITE      = "\033[0;107m"
      RED        = "\033[0;31m"
      GREEN      = "\033[0;32m"
      YELLOW     = "\033[0;33m"
      L_GRAY     = "\033[0;37m"
      CYAN       = "\033[0;36m"
      BLUE_BG    = "\033[0;44m"
      GRAY_BG    = "\033[0;100m"
      ORANGE     = "\033[38;5;136m"
      ROSE       = "\033[38;5;167m"
      BOLD       = "\033[0;01m"
      DIM        = "\033[0;02m"
      UNDERSCORE = "\033[0;04m"
      BINK       = "\033[0;05m"

      # Methods where the first argument is the text content
      [
        # block-level calls
        :block_html,

        # span-level calls
        :autolink, :double_emphasis,
        :underline, :raw_html,
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

      def block_code(text, lang="")
        lang ||= lang.to_s
        result = "```#{lang}\n"
        if lang.match RUBY_LANG
          result << ColorCode::Ruby.new(text).colorize
        else
          result << ColorCode::Unknown.new(text).colorize
        end
        result << "```\n"
        result
      end

      def codespan(text)
        GRAY_BG + "`#{text}`" + COLOR_OFF
      end

      def emphasis(text)
        [ BOLD, '*', text,
          '*',  COLOR_OFF ].inject("") { |memo, v| memo << v.to_s }
      end

      def header(text, header_level)
        heads = "".tap {|h| header_level.times {h << "#"} }
        heads << " "
        op = [ BLUE_BG,   "\n", heads, text,
          COLOR_OFF, "\n" ].inject("") { |memo, v| memo << v.to_s }
      end

      def list(text, type)
        text.lines.inject("") do |memo, line|
          memo << "  " + line
        end + "\n"
      end

      def list_item(text, type)
        if type.match UNORDERED
          "#{ORANGE}- #{COLOR_OFF}" + text
        else
          text
        end
      end

      def paragraph(text)
        "\n" + text + "\n"
      end

      def block_quote(text)
        [ ROSE,      "> ", text.strip,
          COLOR_OFF, "\n" ].inject("") { |memo, v| memo << v.to_s }
      end

      def hrule
        "\n----"
      end

    end
  end
end
