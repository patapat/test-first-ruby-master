def add(x,y)
	x + y
end

def subtract(x,y)
	x - y
end

def sum(arr)
	sum = 0
	return 0 if arr.empty?
	arr.each do |num|
		sum += num
	end
	sum
end

def multiply(*args)
	product = 1
	args.each do |num|
		product *= num
	end
	product
end

def power(x,y)
	x ** y
end

def factorial(num)
	factorial = 1
	return 0 if num == 0
	for i in 1..num do
		factorial *= i
	end
	factorial
end