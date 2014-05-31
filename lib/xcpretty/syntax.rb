module XCPretty
  class Syntax

    def self.highlight(code, options="")
      pygments_available? ? pygmentize(code, options) : code
    end


    private

    def self.pygments_available?
      @available = system('which pygmentize > /dev/null') if @available.nil?
      @available
    end

    def self.pygmentize(code, options)
      `echo "#{code}" | pygmentize -l objc #{options}`
    end
  end
end
