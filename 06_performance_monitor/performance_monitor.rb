require "time"

def measure(sleep = 0)
	start = Time.now
	if sleep == 0
		yield
	else
		sleep.times {yield}
	end
	(Time.now - start) / (sleep == 0 ? 1 : sleep)
end