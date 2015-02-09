#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'optparse'


ValueError = Class.new(StandardError)
def to_i_if_strict(s_i)
  if /^+?\d+$/ =~ s_i
    return s_i.to_i
  else
    raise ValueError
  end
end

def append_multiple_prefix(val, s)
  if val > 1
    s += 's'
  end
  return "#{val} #{s}"
end

def get_datedelta_format(sec, min, hour)
  hour_s = append_multiple_prefix(hour, 'hour')
  min_s  = append_multiple_prefix(min,  'minute')
  sec_s  = append_multiple_prefix(sec, 'second')
  if hour == 0 and min == 0 and sec == 0
    return "0 second"
  elsif hour == 0 and min == 0 and sec != 0
    return sec_s
  elsif hour == 0 and min != 0 and sec == 0
    return min_s
  elsif hour == 0 and min != 0 and sec != 0
    return "#{min_s} and #{sec_s}"
  elsif hour != 0 and min == 0 and sec == 0
    return hour_s
  elsif hour != 0 and min == 0 and sec != 0
    return "#{hour_s} and #{sec_s}"
  elsif hour != 0 and min != 0 and sec == 0
    return "#{hour_s} and #{min_s}"
  else # hour != 0 and min != 0 and sec != 0
    return "#{hour_s}, #{min_s} and #{sec_s}"
  end
end

# build sec, min and hour variable
sec, min, hour = nil, nil, nil
OptionParser.new do |opt|
  opt.on('-s VALUE', '--second VALUE') do |s|
    begin
      sec = to_i_if_strict(s)
    rescue ValueError => ex
      print("Warning: second value is not defined.\n")
    end
  end

  opt.on('-m VALUE', '--month VALUE') do |m|
    begin
      min = to_i_if_strict(m)
    rescue ValueError => ex
      print("Warning: month value is not defined.\n")
    end
  end

  opt.on('-h VALUE', '--hour VALUE') do |h|
    begin
      hour = to_i_if_strict(h)
    rescue ValueError => ex
      print("Warning: hour value is not defined.\n")
    end
  end


  opt.parse!(ARGV)
end

if sec or min or hour
  sec = (sec)? sec: 0
  min = (min)? min: 0
  hour = (hour)? hour: 0
  datedelta_s = get_datedelta_format(sec, min, hour)
  time = hour * 60 * 60 + min * 60 + sec
  sleep time
  print("It spends #{datedelta_s}.\n")

elsif ARGV.size == 1
  time = to_i_if_strict(ARGV[0])
  if not time
    print("Illegal integer format.\n")
  end

  sleep time
  print("It spends #{time} seconds.\n")

else
  print("Illegal input.\n")
end
