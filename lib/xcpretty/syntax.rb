module XCPretty
  class Syntax

    def self.highlight(code)
      pygments_available? ? pygmentize(code) : code
    end


    private

    def self.pygments_available?
      @available = system('which pygmentize > /dev/null') if @available.nil?
      @available
    end

    def self.pygmentize(code)
      `echo "#{code}" | pygmentize -l objc`
    end

  end
end

