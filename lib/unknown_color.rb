module ColorCode
  class Unknown

    def initialize(text)
      @start_line = 1
      @text       = text
    end

    def colorize
      @text.lines.map.with_index do |line, idx|
        line_no = idx + @start_line
        (line_no.to_s.rjust(4) + ": ").colorize(:light_black) + line
      end.join()
    end
  end
end
