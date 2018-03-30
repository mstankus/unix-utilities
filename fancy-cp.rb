#!/usr/bin/env ruby

require 'date'
def fancy_cp(dir,pref,aList)
  puts "mkdir -p \"#{dir}/#{pref}\"";
  while not aList.empty? do
    item = aList.shift;
    fn2 = "#{dir}/#{pref}/#{pref}-#{File.basename(item)}"
    puts "/bin/cp \"#{item}\" \"#{fn2}\""
    puts "ls -l \"#{fn2}\""
  end
end

def fancy_date(date)
  return "#{date.month.to_s.rjust(2,'0')}-#{date.mday.to_s.rjust(2,'0')}-#{date.year}"
end
