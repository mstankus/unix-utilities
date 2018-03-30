
def create_has_string(str)
  return Proc.new {|blk| block_has_string(blk,str) }
end

#
# This routine returns an empty list of lists
# or a list of one list.
#
# Good for throwing away blocks I don't care about.
#
def block_has_string(blk,str)
  result = false;
  blk.each { |x| result = (result or x.has_string(str)); }
  blks = [];
  blks = [blk] if result;
  return blks
end

def block_has_all_strings(blk,strs)
  result = true;
  strs.each { |astr|
    if result then
      within = false;
      blk.each { |x| within = (within or x.has_string(astr)); }
      if !within then 
        result = false;
        break;
      end
    end
  }
  blks = [];
  blks = [blk] if result;
  return blks
end

def block_has_some_strings(blk,strs)
  result = false;
  strs.each { |str|
    if !result then
      blk.each { |x| result = (result or x.has_string(str)); }
    end
  }
  blks = [];
  blks = [blk] if result;
  return blks
end

def create_not_have_string(str)
  return Proc.new {|blk| block_not_have_string(blk,str) }
end

#
# This routine returns an empty list of lists
# or a list of one list.
#
# Good for throwing away blocks I don't care about.

def block_not_have_string(blk,str)
  result = false;
  blk.each { |x| result = (result or x.has_string(str)); }
  blks = [blk];
  blks = [] if result;
  return blks
end

def create_change(str)
  return Proc.new {|blk| block_change(blk,str) }
end

def block_change(blk,aHash)
  inc = aHash["ix"]; 
  rm = aHash["rm"]; 
  ans = [ blk ];
  STDERR.puts "inc:#{transform(inc)}";
  STDERR.puts "rm:#{transform(rm)}";
  if block_has_all_strings(blk,inc) and block_has_some_strings(blk,rm) then 
    incs = [];
    rms = [];
    blk.each_with_index { |ent,i|
      inc.each { |yo|
        if ent.has_string(yo) and ent.has_string(yo) then
          incs << i
          break
        end
      } 
      rm.each { |yo|
        if ent.has_string(yo) and ent.has_string(yo) then
          rms << i;
          break
        end
      }
    }
    incs.uniq!
    rms.uniq!
    STDERR.puts "incs:#{transform(incs)}";
    STDERR.puts "rms:#{transform(rms)}";
    rms = rms - incs;
    STDERR.puts "rms:#{transform(rms)}";
    if (not incs.empty?) and (not rms.empty?) then 
      ans = [ ];
      STDERR.puts "rms inside:#{transform(rms)}";
      blk.each_with_index { |ent,i|
        if rms.include?(i) then
          STDERR.puts "Removing #{transform(ent)}";
          ent.set_rm();
          ans << ent;
        else
          ans << ent;
        end
      }
      ans = [ans];
    end
  end
  STDERR.puts "ans:#{transform(ans)}";
  return ans;
end
