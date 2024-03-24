# frozen_string_literal: true

require 'active_support/all'

# You can pass in a time, the time will be checked if it was or was not leet in the timezone given!
class LeetTime
  def initialize; end

  def self.greet
    '1337 71m3'
  end

  def leet_time?(time)
    @leet_time_with_zone = time.in_time_zone
    @leet_time_with_zone.hour == 13 && @leet_time_with_zone.min == 37
  end

  def now_before_leet?
    lt = Time.now.in_time_zone.change(hour: 13, min: 37)
    ct = Time.now.in_time_zone

    ct.before?(lt)
  end

  def now_after_leet?
    lt = Time.now.in_time_zone.change(hour: 13, min: 37)
    ct = Time.now.in_time_zone

    ct.after?(lt)
  end
end
