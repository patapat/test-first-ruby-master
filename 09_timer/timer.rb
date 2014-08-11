class Timer
	attr_accessor :seconds
	
	def initialize
		@seconds = 0
	end

	def time_string
		final_time = "test"
		hours = @seconds / 3600
		final_hours = self.padded(hours)
		minutes = (@seconds - (3600 * hours)) / 60
		final_minutes = self.padded(minutes)
		seconds = (@seconds - (3600 * hours) - (60 * minutes))
		final_seconds = self.padded(seconds)
		final_time = "#{final_hours}:#{final_minutes}:#{final_seconds}"
		final_time
	end

	def padded(time)
		if time < 10
			time = '0' + time.to_s
		else
			time.to_s
		end
	end
end