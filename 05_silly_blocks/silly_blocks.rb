def reverser
	yield.split.map { |word| word.reverse!}.join(" ")
end

def adder(num=1, &block)
  block.call + num
end

def repeater(n=0)
	if n == 0
		yield 
	else
		n.times do |i|
			yield
		end
	end
end