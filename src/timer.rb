#!/usr/bin/env ruby
# -*- coding: utf-8 -*-


def to_i_if_strict(s_i)
  if /^[+-]?\d+$/ =~ s_i
    return s_i.to_i
  else
    return nil
  end
end

if ARGV.size != 1
  print("Enter only sec\n")
end

time = to_i_if_strict(ARGV[0])
if not time
  print("Illegal integer format.")
end

sleep time
print("It spends #{time} time.\n")
