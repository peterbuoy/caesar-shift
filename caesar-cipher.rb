# Maintain case and punctuation
# ASCII capitals characters are 65(A) to 90(Z)
# ASCII lowercase characters are 97(a) to 122(z)

def caesar_cipher(string, shift_factor)
	shift_factor %= 26
	puts "Initial string:\n#{string}\n"
	char_array = string.split('')
	ascii_array = char_array.map { |x| x.ord }
	shifted_ascii_array = ascii_array.map { |x| ascii_letter_shift(x, shift_factor)}
	shifted_char_array = shifted_ascii_array.map { |x| x.chr }
	shifted_string = shifted_char_array.join('')
	puts "Shifted string:\n#{shifted_string}\n"
	shifted_string
end

def ascii_letter_shift(x, shift_factor)
	# this is very messy, the nested conditional can probably be fixed
	if x.between?(65, 90)
		raw_shift_result = x + shift_factor
		if raw_shift_result <= 90
			return raw_shift_result
		else
			return raw_shift_result % 90 + 65
		end
	elsif x.between?(97, 122)
		raw_shift_result = x + shift_factor
		if raw_shift_result <= 122
			return raw_shift_result
		else
			return raw_shift_result % 122 + 90
		end
	else 
		return x
	end
end

caesar_cipher("That's a lot of damage!", 27)
