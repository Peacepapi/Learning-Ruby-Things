=begin 
	Pier Yos
	Basic Ruby Practice	
=end

system ("clear")

survior = <<MAN
 _________
|         |
|
|
|       |_0_|
|         |
|        / \\
MAN
hangman = <<HANG
 _________
|         |
|         0
|        /|\\
|        / \\
|
|
HANG

puts "LET'S PLAY HANGMAN!!!!!!!!"

possible_phrases = ["Chicken Soup", "Pokemon Master", "Dictionary", "Mercedes Car", "Runescape", "Maplestory", "Ultimate Rap League"]
input = possible_phrases[rand(possible_phrases.length)].downcase

max_tries = input.length - 2
letter_guessed = []
display_word = ""

#change string to array of char and iterate
input.chars.each do |c|
	c != " " ? display_word += "_" : display_word += " "
end

while true
	puts "\t\t\t\t You have #{max_tries} tries left."
	puts "\t\t\t\t #{display_word}"

	#win condition
	unless display_word.include? "_"
		system ("clear")
		puts "*" * 100
		puts survior
		puts "\t\t\t\t YOU WON!!!!"
		puts "*" * 100
		break
	end

	if max_tries != 0
		#get input from user, make it lower case to match, chomp to kill new line
		guess = gets.downcase.chomp

		if guess == "exit"
			system ("clear")
			puts "\t\t\t\t LET's PLAY AGIN SOON. BYE!!!!!!!"
			break
		#check if letter in input
		elsif input.include? guess
			#change string into an array of chars, iterate with the char and index
			input.chars.each_with_index do |c,i|
				if c == guess	
					display_word[i] = guess
				end
			end
		#to check if the letter was guessed again
		elsif letter_guessed.include? guess
			puts "You already guess that letter"
		else 
			#put wrong guess in an array
			letter_guessed.push(guess)
			max_tries -= 1;
			puts "\t\t\t\t '#{guess}' is not present."
		end
	else
		system ("clear")
		puts "*" * 100
		puts "\t\t\t\t YOU LOSE!!!!"
		puts hangman
		puts "\t\t\t\t You had to guess '#{input}'."
		puts "*" * 100
		break
	end
end
