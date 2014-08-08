def translate(phrase)
	vowels = 'aeiou'
	final_phrase = ""
	split_phrase = phrase.split(' ')
	split_phrase.each do |word|
		count = -1
		word.each_char do |c|
			count += 1
			next if c == 'u' and word[count-1] == 'q'
			if vowels.include? c
				final_phrase += word[count...word.length] + word[0...count] + "ay" + " "
				break
			end
		end
	end
	final_phrase.strip
end