require 'test/unit'
require_relative "../lib/lexicon"

class LexiconTests < Test::Unit::TestCase
  
  Pair = Lexicon::Pair
  @@lexicon = Lexicon.new()

  def test_directions()
    assert_equal([Pair.new(:direction, 'north')], @@lexicon.scan("north"))
    result = @@lexicon.scan("north south east")
    assert_equal(result,
                 [Pair.new(:direction, "north"),
                 Pair.new(:direction, 'south'),
                 Pair.new(:direction, 'east')])
  end

  def test_verbs()
    assert_equal(@@lexicon.scan("go"), [Pair.new(:verb,'go')])
    result = @@lexicon.scan("go kill eat")
    assert_equal(result, [Pair.new(:verb, 'go'),
                         Pair.new(:verb, 'kill'),
                         Pair.new(:verb, 'eat')])
  end

  def test_stops()
    assert_equal(@@lexicon.scan("the"), [Pair.new(:stop, 'the')])
    result = @@lexicon.scan("the in of")
    assert_equal(result, [Pair.new(:stop, 'the'),
                         Pair.new(:stop, 'in'),
                         Pair.new(:stop, 'of')])
  end

  def test_numbers()
    assert_equal([Pair.new(:number, 1234)],@@lexicon.scan("1234") )
    assert_equal(@@lexicon.scan("3 91234"),[Pair.new(:number, 3),
                                            Pair.new(:number, 91234)])
  end
end
