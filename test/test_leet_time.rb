# frozen_string_literal: true

require 'minitest/autorun'
require 'leet_time'
require 'active_support/testing/time_helpers'
include ActiveSupport::Testing::TimeHelpers
class LeetTimeTest < Minitest::Test
  def test_greet
    assert_equal '1337 71m3',
                 LeetTime.greet
  end

  def test_is_leet?
    assert_same(LeetTime.new.leet_time?(Time.new(1337, 1, 1, 1, 37)), false) # should not be leet!
    assert_same(LeetTime.new.leet_time?(Time.new(1337, 1, 1, 13, 37)), true) # should be leet!
  end

  def test_before_leet?
    travel_to Time.new(1337, 1, 1, 01, 01, 00)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)


    travel_to Time.new(1337, 1, 1, 13, 37, 00)
    assert_same(LeetTime.new.now_before_leet?, false)

    travel_to Time.new(1337, 1, 1, 13, 38, 00)
    assert_same(LeetTime.new.now_before_leet?, false)
  end

  def test_after_leet?
    travel_to Time.new(1337, 1, 1, 01, 01, 00)
    assert_same(LeetTime.new.now_after_leet?, false)
    assert_same(LeetTime.new.now_after_leet?, false)
    assert_same(LeetTime.new.now_after_leet?, false)
    assert_same(LeetTime.new.now_after_leet?, false)

    travel_to Time.new(1337, 1, 1, 13, 37, 00)
    assert_same(LeetTime.new.now_after_leet?, false)

    travel_to Time.new(1337, 1, 1, 13, 38, 00)
    assert_same(LeetTime.new.now_after_leet?, true)
  end
end
