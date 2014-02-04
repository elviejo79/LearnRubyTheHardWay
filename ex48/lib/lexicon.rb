class Lexicon
  Pair = Struct.new(:token, :word)

  def initialize()
    @words = {:direction => %w(north south east west down up left right back),
      :verb => %w(go stop kill eat),
      :stop => %w(the in of from at it),
      :nouns => %w(door bear princess cabinet),
      :number => ["/\d+/"]
    }

    @transposed_words = nil

    transpose_words()
  end

  def transpose_words()
    if !@transposed_words 
      @transposed_words = {}
      @words.each do |t, words|
        words.each do |w|
          @transposed_words[w] = t
        end
      end
    end

    return @transposed_words
  end

  def scan(words)
    words.split().
      select{|w| @transposed_words.key?(w) || w =~ @words[:numbers]}.
      map{|w| Pair.new(@transposed_words[w],w)}
  end
end
