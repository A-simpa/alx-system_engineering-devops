#!/usr/bin/env ruby
print ARGV[0].scan(/\[from:([a-zA-Z]+|[+0-9]{11,12})\]/).join,","
print ARGV[0].scan(/\[to:([a-zA-Z]+|[+0-9]{11,12})\]/).join,","
puts  ARGV[0].scan(/\[flags:([-01:]+)\]/).join
