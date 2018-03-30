#!/usr/bin/env ruby 

class Entry 
  # @str holds a string which is filename
  # @rm  indicates if the file is marked for deletion.
  def initialize(str)
    @str = str.dup;
    @rm  = false;
  end
  def has_string(the_str)
    ans = false;
    if @str.is_a?(Entry) then
      ans = @str.include?(the_str.get_str);
    else
      ans = @str.include?(the_str);
    end
    return ans;
  end
  def set_rm
    @rm = true;
  end
  def get_rm
    return @rm;
  end
  def get_str
    return @str;
  end
  def fn
    return File.basename(@str);
  end
end
