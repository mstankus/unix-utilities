#!/usr/bin/ruby

class RomanCounter
  def initialize(io)
    @io = io;
    reset();
  end
  def tick()
    @count1 += 1;
    @count2 += 1;
    @count3 += 1;
    @count4 += 1;
    @total += 1;
    if @count4==10000 then
      @io.putc "(#{@total})";
      @count1=0;
      @count2=0;
      @count3=0;
      @count4=0;
    elsif @count3==1000 then
      @io.putc "M";
      @count1=0;
      @count2=0;
      @count3=0;
    elsif @count2==100 then
      @io.putc "C";
      @count1=0;
      @count2=0;
    elsif @count1==10 then
      @io.putc "X";
      @count1=0;
    end
  end
  def reset()
    @count1 = 0;
    @count2 = 0;
    @count3 = 0;
    @count4 = 0;
    @total= 0;
  end
end
