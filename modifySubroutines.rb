#!/usr/bin/ruby

$command_hash = {};

########################## 

def my_append(result,the_list,line)
  result = result + the_list.shift;
  return [result,the_list];
end

$command_hash["-a"]                  = :my_append;
$command_hash["--append"]            = :my_append;

########################## 

def my_basename(result,the_list,line)
  result = result + File.basename(line);
  return [result,the_list];
end

$command_hash["-b"]                  = :my_basename;
$command_hash["--basename"]          = :my_basename;

########################## 

def my_comma(result,the_list,line)
  result = result + ',';
  return [result,the_list];
end

$command_hash["-c"]                  = :my_comma;
$command_hash["--comma"]             = :my_comma;

########################## 

def my_count(result,the_list,line)
  result = result + $count.to_s;
  return [result,the_list];
end

$command_hash["--count"]             = :my_count;

########################## 

def my_cut_front(result,the_list,line)
  cnt = the_list.shift.to_i;
  result = result[cnt..-1];
  return [result,the_list];
end

$command_hash["--cut-front"]         = :my_cut_front;

########################## 

def my_directory(result,the_list,line)
  result << File.dirname(line);
  return [result,the_list];
end

$command_hash["-d"]                 = :my_directory;
$command_hash["--directory"]         = :my_directory;

########################## 

def my_date(result,the_list,line)
  result << Time.now.to_s;
  return [result,the_list];
end

$command_hash["--date"]              = :my_date;

########################## 

def my_del(result,the_list,line)
  todel = the_list.shift;
  result.gsub!(todel,"");
  return [result,the_list];
end

$command_hash["--del"]               = :my_del;
$command_hash["--delete"]            = :my_del;

########################## 

def my_delete_front(result,the_list,line)
  cnt = the_list.shift.to_i;
  str = line.dup;
  aList = str.split("/").slice(0,cnt);
  it = File.join(aList);
  result << it;
  return [result,the_list];
end

$command_hash["--delete-front"]      = :my_delete_front;

########################## 

def my_delete_last(result,the_list,line)
  cnt = the_list.shift.to_i;
  str = line.dup;
  aList = str.split("/").slice(-cnt,cnt);
  it = File.join(aList);
  result << it;
  return [result,the_list];
end

$command_hash["--delete-back"]       = :my_delete_last;

########################## 

def my_even_append(result,the_list,line)
  str = the_list.shift;
  if ($count%2)==0 then
    result << str;
  end
  return [result,the_list];
end

$command_hash["--evena"]             = :my_even_append;

########################## 


def my_ext(result,the_list,line)
   result << File.extname(line.to_s);
  return [result,the_list];
end

$command_hash["--ext"]               = :my_ext;

########################## 

def my_lowercaseletter(result,the_list,line)
  result << ((?a)+($count-1)).chr;
  return [result,the_list];
end

$command_hash["--lower"]             = :my_lowercaseletter;

########################## 

def my_remove_char(result,the_list,line)
  front = the_list.shift.to_i;
  back = the_list.shift.to_i;
  result = result[front..-back]
  result [result,the_list];
end

$command_hash["--remove"]            = :my_remove_char;

########################## 

def my_newline(result,the_list,line)
  result << "\n";
  return [result,the_list];
end

$command_hash["-n"]                  = :my_newline;
$command_hash["--newline"]           = :my_newline;

########################## 

def my_original(result,the_list,line)
  result << line;
  return [result,the_list];
end

$command_hash["-o"]                  = :my_original;
$command_hash["--original"]          = :my_original;

########################## 

def my_original_low(result,the_list,line)
  result << line.downcase;
  return [result,the_list];
end

$command_hash["-olow"]               = :my_original_low;

########################## 

def my_original_high(result,the_list,line)
  result << line.upcase;
  return [result,the_list];
end

$command_hash["-ohigh"]               = :my_original_high;

########################## 

def my_original_even(result,the_list,line)
  if ($count%2)==0 then
    result << line;
  end
  return [result,the_list];
end

$command_hash["--eveno"]             = :my_original_even;

########################## 

########################## 

def my_original_odd(result,the_list,line)
  str = the_list.shift;
  if ($count%2)==1 then
    result << str;
  end
  return [result,the_list];
end

$command_hash["-oodd"]               = :my_original_odd;

########################## 

def my_original_even(result,the_list,line)
  if ($count%2)==0 then
    result << line.to_s;
  end
  return [result,the_list];
end

$command_hash["-oeven"]               = :my_original_even;

########################## 

def my_pad_left(result,the_list,line)
  cnt = the_list.shift.to_i;
  while result.length<cnt  do
	  result = ' ' + result;
  end
  return [result,the_list];
end

$command_hash["-padleft"]               = :my_pad_left;

########################## 

def my_pad_right(result,the_list,line)
  cnt = the_list.shift.to_i;
  while result.length<cnt do
    result = result + ' ';
  end
  return [result,the_list];
end

$command_hash["-padright"]               = :my_pad_right;

########################## 

def my_quote(result,the_list,line)
  result << '"';
  return [result,the_list];
end

$command_hash["-q"]                  = :my_quote;
$command_hash["--quote"]             = :my_quote;

########################## 

def my_replace(result,the_list,line)
  before = the_list.shift;
  after = the_list.shift;
  result.gsub!(before,after);
  return [result,the_list];
end

$command_hash["-r"]                  = :my_replace;
$command_hash["-relace"]             = :my_replace;

########################## 

def my_uppercaseletter(result,the_list,line)
  result << ((?A)+($count-1)).chr;
  return [result,the_list];
end

$command_hash["-u"]                  = :my_uppercaseletter;
$command_hash["--upper"]             = :my_uppercaseletter;

########################## 

def my_latexnewline(result,the_list,line)
  result =result + "\\\\";
  return [result,the_list];
end

$command_hash["--latex-newline"]     = :my_latexnewline;

########################## 

def my_backslash(result,the_list,line)
  result = result + "\\";
  return [result,the_list];
end

$command_hash["--backslash"]         = :my_backslash;

########################## 
