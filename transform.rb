
def transform(it)
  ans = nil?;
  if it.is_a?(Entry) then
    ans = [it.get_str,it.get_rm];
  elsif it.is_a?(Numeric) then
    ans = it;
  elsif it.is_a?(String) then
    ans = it;
  elsif it.is_a?(Array) then
    ans = it.map { |x| transform(x) }
  else
    STDERR.puts "unknown type!";
    pp it;
  end
  return ans;
end

