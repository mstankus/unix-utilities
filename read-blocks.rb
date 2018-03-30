
def read_block_by_filename(arr) 
  aListOfLists = []
  currentBlock = []
  inblock = false;
  lines = arr.select { |x| !(x.start_with?("##")) };
  lines = lines.map { |x| x.chomp.gsub("//","/") }
  withsharp = lines.select { |x| x.start_with?("#"); }
  if withsharp.empty? then
    aListOfLists = [ lines.collect { |y| Entry.new(y) } ];
  else 
    withsharp.each { |x|
      if x.start_with?("#[") then
        if inblock then
          STDERR.puts "Starting block twice!!!";
          exit(0);
        else
          inblock = true;
        end
      elsif x.start_with?("#]") then
        if inblock then
          inblock = false;
          aListOfLists << currentBlock;
          currentBlock = [];
        else
          STDERR.puts "Ending block twice!!!";
          exit(0);
        end
      elsif x.start_with?("# ") then
         if inblock then 
           # Grab the file name
           y=x.chomp;
           y = y[2..-1];
           y.strip!;
           if y[0..0]=="\"" and y[-1..-1]=="\"" then
             y = y[1..-2];
   	     currentBlock << Entry.new(y);
	   else
             STDERR.puts "Errorneous input!!!";
             STDERR.puts x;
             exit(0);
	   end
         else
           STDERR.puts "Errorneous input!!!";
           STDERR.puts x;
           exit(0);
         end
      else
        STDERR.puts "Errorneous input!!!";
        STDERR.puts x;
        exit(0);
      end
    }
  end
  return aListOfLists;
end
