require 'rouge'
require 'xcpretty/snippet'

module XCPretty
  module Syntax
    def self.highlight(snippet)
      if snippet.file_path.include?(':')
        filename = snippet.file_path.rpartition(':').first
      else
        filename = snippet.file_path
      end

      options = {
        :filename => File.basename(filename),
        :source => snippet.contents,
      }
      lexer = Rouge::Lexer.guesses(options).first

      if !lexer && File.extname(filename) == '.m'
        # Objective-C is hard to guess when you use BDD style frameworks like Kiwi and Specta
        lexer = Rouge::Lexers::ObjectiveC
      end

      if lexer
        formatter = Rouge::Formatters::Terminal256.new
        formatter.format(lexer.lex(snippet.contents))
      else
        snippet.contents
      end
    end
  end
end

