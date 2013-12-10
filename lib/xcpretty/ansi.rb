module XCPretty
  module ANSI

    FORMATTED_MATCHER = %r{\e\[(\d+)[;]?(\d+)?m(.*)\e\[0m}

    EFFECT = {
      :reset     => '0',
      :bold      => '1',
      :underline => '4'
    }

    COLORS = {
      :black  => '30',
      :red    => '31',
      :green  => '32',
      :yellow => '33',
      :blue   => '34',
      :cyan   => '36',
      :white  => '37'
    }

    def white(text)
      ansi_parse(text, :black, :bold)
    end

    def red(text)
      ansi_parse(text, :red)
    end

    def green(text)
      ansi_parse(text, :green, :bold)
    end

    def cyan(text)
      ansi_parse(text, :cyan)
    end

    def applied_effects(text)
      effects = []
      if text =~ FORMATTED_MATCHER
        colors = COLORS.invert[$1]
        effect = EFFECT.invert[$2]
        effects << colors if colors
        effects << effect if effect
      end
      effects
    end

    def strip(text)
      text =~ FORMATTED_MATCHER ? $3 : text
    end

    def ansi_parse(text, color, effect=nil)
      colors_code = COLORS[color]  || ''
      effect_code = EFFECT[effect] ? ';' + EFFECT[effect] : ''
      "\e[#{colors_code}#{effect_code}m#{text}\e[#{EFFECT[:reset]}m"
    end
  end
end