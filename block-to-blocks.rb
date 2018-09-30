
# Before reading, it is a slight oversimplification, but you
# can think the class Entry as holding a string which holds
# a filename.
# 
# Each of the following routines takes a single argument
# which is a list of instances of the class Entry and 
# returns a list of list of instances of class Entry. 
#
# The argument contains a list of instances of the class Entry 
# which are considered the same in some way. 
# 
# The return is a list of lists of instances on the class Entry. 
# Instances of Entry in different lists are considered different.
# Two instances of Entry from the same list are considered 
# (at least somewhat) the same.
#

#
# Mixed filenames
#
def mixed_filenames(blk)
  fns = blk.map { |x| x.fn }
  fns.sort!;
  fns.uniq!
  blks = [];
  blks = [blk] if fns.size>1;
  return blks
end

#
# If blk is a list with size <=1, then get rid of it.
#
def exclude_singleton(blk)
  blks = [];
  blks = [blk] if blk.size>1;
  return blks
end

#
# If two files have different sizes, then treat them as different.
#
def block_by_size(blk)
  aHash = Hash.new { |h,k| h[k] = []; }
  blk.each { |ent|
    fn = ent.get_str;
    if File.exists?(fn) then 
      sz = File.size(fn)
      aHash[sz] << ent;
    end
  }
  return aHash.values;
end

#
# If two files have different basenames, then treat them as different.
#
def block_by_filename(blk)
  aHash = Hash.new { |h,k| h[k] = []; }
  blk.each { |ent|
    fn = ent.get_str;
    if File.exists?(fn) then 
      base = File.basename(fn);
      aHash[base] << ent;
    end
  }
  return aHash.values;
end

#
# If two files have different extensions, then treat them as different.
#
def block_by_extension(blk)
  aHash = Hash.new { |h,k| h[k] = []; }
  blk.each { |ent|
    fn = ent.get_str;
    if File.exists?(fn) then 
      base = File.extname(fn);
      aHash[base] << ent;
    end
  }
  return aHash.values;
end

def block_by_must(blk)
  blocks = [];
  str = $change["must"][0]; 
  if blk.any? { |fn| fn.has_string(str) } then
   blocks = [blk];
  end
  return blocks;
end

def block_by_not_must(blk)
  blocks = [];
  str = $change["must-note"][0]; 
  if blk.any? { |fn| !fn.has_string(str) } then
   blocks = [blk];
  end
  return blocks;
end

#
# If a block contains more than one Entry, remove the Entry's 
# after the first one.
#
def shrink_to_first(blk)
  result  = [];
  if ! blk.empty? then
    list = [ blk.first ];
    result = [ list ];
  end
  return result
end

#
# If a block contains more than one Entry, remove the Entry's 
# before the last one.
#
def shrink_to_last(blk)
  result  = [];
  if ! blk.empty? then
    list = [ blk.last ];
    result = [ list ];
  end
  return result
end

$count=0;

#
# If two files are considered different by the unix diff command, then 
# treat them as different.
#
def silent_diff_on_block(blk)
  if ! $counter.nil? then 
    $counter.tick;
  end
  klasses = []
  aList = blk.select { |x| File.exists?(x.get_str) };
  aList.each { |ent|
    fn1 = ent.get_str;
    done = false;
    klasses.each_index { |i|
      ent2 = klasses[i][0];
      fn2 = ent2.get_str;
#      STDERR.puts "#{fn1} vs. #{fn2}";
      cmd = "diff --brief -r \"#{fn2}\" \"#{fn1}\"";
      stuff = `#{cmd}`;
      if stuff.empty? then
        klasses[i] << ent;
        done = true;
        break;
      end
    }
    if !done then
      klasses << [ent];
    end
  }
  return klasses
end

#
# This routine is all about side effects.
# Diff an entry with the entries which appear after it
# and save the results to files.
#
def visual_diff_on_block(blk)
  $vstr = "BACKUP";
  $count = $count + 1;
  sz = blk.size;
  (0..(sz-1)).each { |i|
	fn1 = blk[i].get_str;
    keep1 = File.exists?(fn1);
    next if (not keep1);
    ((i+1)..(sz-1)).each { |j|
	  fn2 = blk[j].get_str;
      keep2 = File.exists?(fn2);
      if $vstr.size >0 then 
        keep2 = keep2 and (fn1.include?($vstr) or fn2.include?($vstr));
      end
      next if (not keep2);
      File.open("diffs.#{$count}.#{i}.#{j}","w") { |io|
	    fn2 = blk[j].get_str;
        io.puts "File 1: #{fn1}";
        io.puts "File 2: #{fn2}";
        cmd = "diff \"#{fn1}\" \"#{fn2}\"";
        io.puts `#{cmd}`;
      }
    }
  }
  return [blk]
end

#
# This routine is all about side effects.
# Print out block AND pay attention to get_rm method.
#
def print_block(blk)
  puts "#[";
  blk.each { |ent|
    if ent.get_rm then
      puts "rm -r \"#{ent.get_str}\"";
    else 
      puts "#  \"#{ent.get_str}\"";
    end
  }
  puts "#]";
  return [blk];
end

def block_by_exists(blk)
  ans = [];
  blk.each { |ent|
    fn = ent.get_str;
    if File.exists?(fn) then 
      ans << ent;
    end
  }
  return [ ans ];
end
