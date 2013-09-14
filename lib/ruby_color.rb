require 'syntax/convertors/html'
require 'colorize'

module ColorCode
  class Ruby
    TOKENIZER = Syntax.load "ruby"

    def initialize(text)
      @start_line = 1
      @text       = text
    end

    def colorize
      @text.lines.map.with_index do |line, idx|
        line_no = idx + @start_line
        code_line = ""
        TOKENIZER.tokenize( line ) do |token|
          case token.group.to_s
          when "string"   then code_line += token.colorize(:light_yellow)
          when "ident"    then code_line += token.colorize(:white)
          when "normal"   then code_line += token.colorize(:cyan)
          when "keyword"  then code_line += token.colorize(:blue)
          when "punct"    then code_line += token.colorize(:white)
          when "symbol"   then code_line += token.colorize(:light_black)
          when "number"   then code_line += token.colorize(:light_black)
          when "expr"     then code_line += token.colorize(:white)
          when "comment"  then code_line += token.colorize(:magenta)
          when "constant" then code_line += token.colorize(:yellow) 
          else code_line = code_line + "  group: #{token.group}"
          end
        end
        (line_no.to_s.rjust(4) + ": ").colorize(:light_black) + code_line
      end.join("\n")
    end
  end
end

# Color Choices:
#[:black        , :red          , :green         , :yellow      ,
# :blue         , :magenta      , :cyan          , :white       ,
# :default      , :light_black  , :light_red     , :light_green ,
# :light_yellow , :light_blue   , :light_magenta ,
# :light_cyan   , :light_white ]

