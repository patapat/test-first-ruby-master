class RPNCalculator
	attr_accessor :value

	def initialize
		@value = 0
		@count = 0
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
		if @numbers.any?
			sum = @numbers[-2] + @numbers[-1]
			merge(@numbers, sum)
		else
			raise "calculator is empty"
		end
	end

	def minus
		if @numbers.any?
			difference = @numbers[-2] - @numbers[-1]
			merge(@numbers, difference)
		else
			raise "calculator is empty"
		end
	end

	def divide
		if @numbers.any?
			quotient = Float(@numbers[-2]) / @numbers[-1]
			merge(@numbers, quotient)
		else
			raise "calculator is empty"
		end
	end

	def times
		if @numbers.any?
			product = @numbers[-2] * @numbers.last
			merge(@numbers, product)
		else
			raise "calculator is empty"
		end
	end

	def tokens(str)
		str.split.collect! { |c| c[/\d/] ? c.to_i : c.to_sym }
	end

	def countSym(arr)
		arr.each do |i|
			if i.is_a?(Symbol)
				@count += 1
			end
		end
	end

	def rpn_calc(arr)
		arr.each.with_index do |c, i|
			if c.is_a?(Symbol)
				@numbers = [arr[i-2], arr[i-1]]
				case c
				when :+
					self.plus
				when :-
					self.minus
				when :*
					self.times
				when :/
					self.divide
				else
					raise "invalid operator"
				end
				arr[i] = @value 
				arr.delete_at(i-2)
				arr.delete_at(i-2)
				evaluate(arr.join(" "))
			end
		end
	end

	def evaluate(str)
		arrayed = tokens(str)
		countSym(arrayed)
		while @count > 1
			@count = 0
			rpn_calc(arrayed)
			countSym(arrayed)
		end
		while arrayed.length > 3
			arrayed.each.with_index do |c, i|
				if c.is_a?(Symbol)
					@numbers = [arrayed[i-2], arrayed[i-1]]
					case c
					when :+
						self.plus
					when :-
						self.minus
					when :*
						self.times
					when :/
						self.divide
					else
						raise "invalid operator"
					end
					arrayed[i-1] = @value 
					arrayed.delete_at(i-2)
					evaluate(arrayed.join(" "))
				end
			end
		end
		rpn_calc(arrayed)
		@value
	end
end

=begin
[1, 2, 7, :+]
=end