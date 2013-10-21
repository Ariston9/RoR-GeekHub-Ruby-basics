class Magic_ball
	def initialize
		@answer=" It is certain. It is decidedly so. Without a doubt. Yes - definitely. Yes may rely on it. As I see it, yes. Most likely. Outlook good. Signs point to yes. Yes. Reply hazy, try again. Ask again later. Better not tell you now. Cannot predict now. Concentrate and ask again. Don\'t count on it. My reply is no. My sources say no. Outlook not so good. Very doubtful".split(".")
		puts "Hello, I\'m a Magic Ball ! If you want to get answer for your questions, please type it below..."
	end 

	def shake
		get_question
		print "Shake the Magic Ball?"
		if y_or_n == "Y"
			puts "Think..."
			sleep rand(5)+1
			puts @answer[rand(20)]
		end
		print "Do you have another question?"
		if y_or_n == "Y"
			shake
		end
	end

	def get_question
		print "Input your guestion: "
		@quastion = gets.chomp
		while @quastion == ""
			puts "I don't have answer for empty quastion. Please input your quastion again."
			@quastion = gets.chomp
		end
			
	end
	
	private
	
	def y_or_n
		yes_or_not = ""		
		until (yes_or_not.include? ?Y) or (yes_or_not.include? ?N)
			print " Please, type Y or N :"
			yes_or_not = gets.upcase.chomp
		end
		return yes_or_not
	end
end

# Создаем экземпляр шара
my_ball = Magic_ball.new
# В любой момент можно узнать ответ на вопрос вызвав метод shake для существующего экземпляра шара
my_ball.shake

