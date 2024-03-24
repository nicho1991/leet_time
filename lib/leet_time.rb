# frozen_string_literal: true

require 'active_support/all'

# You can pass in a time, the time will be checked if it was or was not leet in the timezone given!
class LeetTime
  attr_reader :timezone

  def initialize(timezone: Time.zone)
    @timezone = timezone
  end

  def self.greet
    '1337 71m3'
  end

  def leet_time?(time = Time.current)
    time.hour == 13 && time.min == 37
  end

  def now_before_leet?
    lt = Time.current.in_time_zone(timezone).change(hour: 13, min: 37)
    ct = Time.current

    ct_seconds = ct.hour.hours + ct.min.minutes
    lt_seconds = lt.hour.hours + lt.min.minutes

    ct_seconds < lt_seconds
  end

  def now_after_leet?
    lt = Time.current.in_time_zone(timezone).change(hour: 13, min: 37)
    ct = Time.current

    ct_seconds = ct.hour.hours + ct.min.minutes
    lt_seconds = lt.hour.hours + lt.min.minutes

    ct_seconds > lt_seconds
  end
end
