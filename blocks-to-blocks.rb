# 
# Create a list of list of instances of the class Entry. 
#

#
# Merge all of the blocks.
#
def combine_blocks(blks)
  ans = [];
  blks.each { |blk| ans = ans + blk; }
  return [ ans ];
end
