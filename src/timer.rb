#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'optparse'


VERSION = 0.2
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
  else # hour != 0,  min != 0 and sec != 0
    return "#{hour_s}, #{min_s} and #{sec_s}"
  end
end

if __FILE__ == $0
  begin
    # build sec, min,  hour, and message variable
    message = nil
    sec, min, hour = nil, nil, nil
    OptionParser.new do |opt|
      opt.on('-s VALUE', '--second VALUE') do |s|
        sec = Integer(s)
      end

      opt.on('-m VALUE', '--minute VALUE') do |m|
        min = Integer(m)
      end

      opt.on('-h VALUE', '--hour VALUE') do |h|
        hour = Integer(h)
      end

      opt.on('--msg VALUE', '--message VALUE') do |msg|
        message = msg
      end

      opt.on('-v', '--version') do |v|
        print "Version: #{VERSION}\n"
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
      if message
        print("#{message}\n")
      else
        print("It spent #{datedelta_s}.\n")
      end

    elsif ARGV.size == 1
      time = Integer(ARGV[0])
      sleep time
      sec_s = append_multiple_prefix(time, 'second')
      print("It spent #{sec_s}.\n")
    else
      print("Illegal input.\n")
    end
  rescue ArgumentError => ex
    print("Illegal Input\n")
  end
end
