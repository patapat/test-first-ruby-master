class Book

	def title
		@book
	end
	
	def title=(title)
	    @book = titleize(title)
	end
	
	private

	def titleize(book_title)
		excluded_words = ['the', 'a', 'an', 'and', 'in', 'of']
		count = -1
		final_phrase = []
		split_phrase = book_title.split(' ')
		split_phrase.each do |word|
			count += 1
			if count == 0
				final_phrase.push(word.capitalize)
			elsif excluded_words.include? word
				final_phrase.push(word)
			else
				final_phrase.push(word.capitalize)
			end
		end
		final_phrase.join(' ')
	end
end