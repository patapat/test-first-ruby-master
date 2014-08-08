def echo(phrase)
	phrase
end
def shout(phrase)
	phrase.upcase
end
def repeat(phrase, int=2)
	((phrase + " ") * int).strip
end
def start_of_word(phrase, num_of_chars)
	phrase[0...num_of_chars]
end

def first_word(phrase)
	phrase.split(' ')[0]
end

def titleize(phrase)
	count = -1
	final_phrase = []
	split_phrase = phrase.split(' ')
	split_phrase.each do |word|
		count += 1
		if count == 0
			final_phrase.push(word.capitalize)
		elsif word == "over" or word == "the" or word == "and"
			final_phrase.push(word)
		else
			final_phrase.push(word.capitalize)
		end
	end
	final_phrase.join(' ')
end