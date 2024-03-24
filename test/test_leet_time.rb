# frozen_string_literal: true

require 'minitest/autorun'
require 'leet_time'

class LeetTimeTest < Minitest::Test
  def test_greet
    assert_equal '1337 71m3',
                 LeetTime.greet
  end

  def test_is_leet?
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 1, 37)).is_leet?, false) # should not be leet!
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 37)).is_leet?, true) # should be leet!
  end

  def test_before_leet?
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 12, 37)).before_leet?, true)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 36)).before_leet?, true)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 37)).before_leet?, false)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 38)).before_leet?, false)
  end

  def test_after_leet?
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 12, 37)).after_leet?, false)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 36)).after_leet?, false)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 37)).after_leet?, false)
    assert_same(LeetTime.new(Time.new(1337, 1, 1, 13, 38)).after_leet?, true)
  end
end
