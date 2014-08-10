class RPNCalculator
	attr_accessor :value

	def initialize
		@value = 0
		@numbers = []
	end

	def push(num)
		@numbers.push(num)
	end

	def merge(nums, result)
		nums.delete_at(-1)
		nums[-1] = result
		@value = nums.last
	end

	def plus
		sum = @numbers[-2] + @numbers[-1]
		merge(@numbers, sum)
	end

	def minus
		difference = @numbers[-2] - @numbers[-1]
		merge(@numbers, difference)
	end

	def divide
		quotient = Float(@numbers[-2]) / @numbers[-1]
		merge(@numbers, quotient)
	end

	def times
		product = @numbers[-2] * @numbers.last
		merge(@numbers, product)
	end
end