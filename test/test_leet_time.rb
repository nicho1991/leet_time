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
    Time.zone = 'UTC'
    travel_to Time.zone.local(1337, 1, 1, 01, 01, 00)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)
    assert_same(LeetTime.new.now_before_leet?, true)


    travel_to Time.zone.local(1337, 1, 1, 13, 37, 00)
    assert_same(LeetTime.new.now_before_leet?, false)

    travel_to Time.zone.local(1337, 1, 1, 13, 38, 00)
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

  def test_provide_timezone
    tz = "Eastern Time (US & Canada)"
    leet_time = LeetTime.new(timezone: tz)
    assert_same(leet_time.timezone, tz)
  end

  def test_leet_in_different_timezone
    Time.zone = 'UTC'
    # test that leet works
    travel_to Time.zone.local(2024, 1, 1, 13, 37, 00)
    leet_time = LeetTime.new(timezone: 'UTC')
    assert_equal(true, leet_time.leet_time?(Time.current))

    # +1
    # UTC 13:37, meaning CET 14:37 (+1)
    Time.zone = 'CET'
    assert_same(false, leet_time.leet_time?)
    assert_same(true, leet_time.now_after_leet?)
    assert_same(false, leet_time.now_before_leet?)

    # -1
    # UTC 13:37, meaning Cape_Verde 12:37 (-1)
    Time.zone = 'Atlantic/Cape_Verde'
    assert_same(false, leet_time.leet_time?(Time.current))
    assert_same(false, leet_time.now_after_leet?)
    assert_same(true, leet_time.now_before_leet?)
  end
end
