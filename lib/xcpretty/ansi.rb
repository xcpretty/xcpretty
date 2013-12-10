module XCPretty
  module ANSI

    EFFECT = {
      :reset         => '0',
      :bold          => '1',
      :underline     => '4'
    }

    COLORS = {
      :black    => '30',
      :red      => '31',
      :green    => '32',
      :yellow   => '33',
      :blue     => '34',
      :cyan     => '36',
      :white    => '37'
    }

    def white(text)
      ansi_parse(text, :white, :bold)
    end

    def red(text)
      ansi_parse(text, :red)
    end

    def green(text)
      ansi_parse(text, :green, :bold)
    end

    def link(text)
      ansi_parse(text, :cyan)
    end

    def ansi_parse(text, color, effect=nil)
      colors_code = COLORS[color]  || ''
      effect_code = EFFECT[effect] ? ';' + EFFECT[effect] : ''
      "\e[#{colors_code}#{effect_code}m#{text}\e[#{EFFECT[:reset]}m"
    end
  end
end