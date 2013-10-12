frase = ""
while frase != "BYE" 
	frase = gets.chomp
	if frase == frase.upcase
		puts "NO, NEITHER TIMES FROM #{ 1930 + rand(21) } YEAR!"
	else
		puts "WHAT? GRANDSON, TALK LOUDER!"
	end
end
