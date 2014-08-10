class Dictionary
	attr_reader :entries, :keywords

	def initialize
		@entries = {}
		@keywords = []
	end

	def add(entry)
		if entry.is_a?(String)
			@entries[entry] = nil
			@keywords.push(entry)
		elsif entry.is_a?(Hash)
			entry.each do |k, v|
				@entries[k] = v
				@keywords.push(k)
			end
		else
			"shutupgreg"
		end
		@keywords.sort!
	end

	def include?(kw)
		@keywords.include? kw
	end

	def find(kw)
		# return {} unless @keywords.include? kw
		results = {}
		@entries.each do |key,value|
			if !!key.match(/^#{kw}[.+]?/)
				entry = @entries.select { |k,v| k == key }
				results.merge!(entry)
			end
		end
		results
	end

	def printable
		all_entries = ""
		@entries.each do |k,v|
			all_entries.prepend("[#{k}] \"#{v}\"\n")
		end
		all_entries.rstrip
		# "[apple] \"fruit\"\n[fish] \"aquatic animal\"\n[zebra] \"African land animal with stripes\""
	end
end

