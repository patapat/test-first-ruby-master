class Temperature
	attr_accessor :options

	def initialize(options = {})
		@options = options
		@f = @options[:f]
		@c = @options[:c]
	end

	def in_fahrenheit
		if @options.has_key? :f
			@f
		else
			ctof(@c)
		end
	end

	def in_celsius
		if @options.has_key? :c
			@c
		else 
			ftoc(@f)
		end
	end

	def self.from_celsius(deg)
		Temperature.new(:c => deg)
	end

	def self.from_fahrenheit(deg)
		Temperature.new(:f => deg)
	end

	def ftoc(deg)
		(deg - 32) * (5.0/9.0)
	end

	def ctof(deg)
		(deg * 9.0/5.0) + 32
	end
end

class Celsius < Temperature
	def initialize(deg)
		super(:c => deg)
	end
end

class Fahrenheit < Temperature
	def initialize(deg)
		super(:f => deg)
	end
end