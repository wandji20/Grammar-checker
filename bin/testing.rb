require 'strscan'

s = StringScanner.new("Fri Dec 12 1975 14:39")
p s.getch
p s.pos = s.pos - 1
p s.scan_until(/\w+/)


p s.scan_until(/\w+/)