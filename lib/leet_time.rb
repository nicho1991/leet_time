# frozen_string_literal: true
require 'active_support/all'

class LeetTime
  def initialize(time)
    @time = time
    @time_with_zone = @time.in_time_zone
  end

  def self.greet
    puts '1337 71m3'
  end

  def is_leet?
    is_hour_min?(hour: 13, min: 37)
  end

  def before_leet?
    Time.now.before?(@time_with_zone.change(hour: 13, minute: 37))
  end

  def after_leet?
    Time.now.after?(@time_with_zone.change(hour: 13, minute: 37))
  end

  private

  def is_hour_min?(hour: Integer, min: Integer)
    hour == @time_with_zone.hour && min == @time_with_zone.min
  end
end
