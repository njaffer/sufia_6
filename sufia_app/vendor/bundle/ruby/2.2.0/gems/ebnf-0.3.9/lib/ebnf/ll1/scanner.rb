require 'strscan'    unless defined?(StringScanner)

module EBNF::LL1
  ##
  # Overload StringScanner with file operations
  #
  # * Reloads scanner as required until EOF.
  # * Loads to a high-water and reloads when remaining size reaches a low-water.
  #
  # FIXME: Only implements the subset required by the Lexer for now.
  class Scanner < StringScanner
    HIGH_WATER = 10240
    LOW_WATER  = 2048     # Hopefully large enough to deal with long multi-line comments

    ##
    # @return [IO, StringIO]
    attr_reader :input

    ##
    # Create a scanner, from an IO or String
    #
    # @param [String, IO, #read] input
    # @param [Hash{Symbol => Object}] options
    # @option options[Integer] :high_water (HIGH_WATER)
    # @option options[Integer] :low_water (LOW_WATER)
    # @return [Scanner]
    def initialize(input, options = {})
      @options = options.merge(:high_water => HIGH_WATER, :low_water => LOW_WATER)

      if input.respond_to?(:read)
        @input = input
        super("")
        feed_me
      else
        super(input.to_s)
      end
    end

    ##
    # Returns the "rest" of the line, or the next line if at EOL (i.e. everything after the scan pointer).
    # If there is no more data (eos? = true), it returns "".
    #
    # @return [String]
    def rest
      feed_me
      encode_utf8 super
    end
    
    ##
    # Attempts to skip over the given `pattern` beginning with the scan pointer.
    # If it matches, the scan pointer is advanced to the end of the match,
    # and the length of the match is returned. Otherwise, `nil` is returned.
    #
    # similar to `scan`, but without returning the matched string.
    # @param [Regexp] pattern
    def skip(pattern)
      feed_me
      super
    end

    ##
    # Returns true if the scan pointer is at the end of the string
    #
    # @return [Boolean]
    def eos?
      feed_me
      super
    end

    ##
    # Set the scan pointer to the end of the string and clear matching data
    def terminate
      feed_me
      super
    end

    ##
    # Tries to match with `pattern` at the current position.
    #
    # If there is a match, the scanner advances the "scan pointer" and returns the matched string.
    # Otherwise, the scanner returns nil.
    #
    # If the scanner begins with the multi-line start expression
    # @example
    #     s = StringScanner.new('test string')
    #     p s.scan(/\w+/)   # -> "test"
    #     p s.scan(/\w+/)   # -> nil
    #     p s.scan(/\s+/)   # -> " "
    #     p s.scan(/\w+/)   # -> "string"
    #     p s.scan(/./)     # -> nil
    #
    # @param [Regexp] pattern
    # @return [String]
    def scan(pattern)
      feed_me
      encode_utf8 super
    end
    
  private
    # Maintain low-water mark
    def feed_me
      if rest_size < @options[:low_water] && @input && !@input.eof?
        # Read up to high-water mark ensuring we're at an end of line
        diff = @options[:high_water] - rest_size
        string = encode_utf8(@input.read(diff))
        string << encode_utf8(@input.gets) unless @input.eof?
        self << string if string
      end
    end

    # Perform UTF-8 encoding of input
    def encode_utf8(string)
      string.respond_to?(:force_encoding) ? string.force_encoding(Encoding::UTF_8) : string
    end
  end
end