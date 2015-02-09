#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'optparse'


def to_i_if_strict(s_i)
  if /^+?\d+$/ =~ s_i
    return s_i.to_i
  else
    print("Warning: #{s_i} is not a positive integer.")
    return nil
  end
end

# build sec, min and hour variable
sec, min, hour = nil, nil, nil
OptionParser.new do |opt|
  opt.on('-s VALUE', '--second VALUE') do |s|
    sec = to_i_if_strict(s)
  end

  opt.on('-m VALUE', '--month VALUE') do |m|
    min = to_i_if_strict(m)
  end

  opt.on('-h VALUE', '--hour VALUE') do |h|
    hour = to_i_if_strict(h)
  end


  opt.parse!(ARGV)
end

if sec or min or hour
  sec = (sec)? sec: 0
  min = (min)? min: 0
  hour = (hour)? hour: 0
  time = hour * 60 * 60 + min * 60 + sec
  sleep time
  print("It spends #{hour} hours, #{min} minutes and #{sec} seconds.")

elsif ARGV.size == 1
  time = to_i_if_strict(ARGV[0])
  if not time
    print("Illegal integer format.")
  end

  sleep time
  print("It spends #{time} seconds.\n")

else
  print("Illegal input.")
end
