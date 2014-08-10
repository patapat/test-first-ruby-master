def reverser
	yield.split.map { |word| word.reverse!}.join(" ")
end

def adder(num=1)
	yield + num
end

def repeater(n=0)
	if n == 0
		yield 
	else
		n.times do
			yield
		end
	end
end