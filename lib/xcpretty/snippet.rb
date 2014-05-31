module XCPretty
  class Snippet

    def self.from_filepath(filepath)
      path, line = filepath.split(':')
      file = File.open(path)

      text = read_snippet(file, line)

      file.close
      text
    rescue
      ''
    end


    private

    def self.read_snippet(file, around_line)
      text = ""
      starting_position = around_line.to_i - 2
      starting_position.times { file.gets }
      3.times { text += readline(file) }
      text
    end

    def self.readline(file)
      file.gets
      $_ || ''
    end

  end
end

