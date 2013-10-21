class Pet
	def initialize name
		@name = name		# Имя питомца
		@life = 365*24		# Время жизни
		@hunger = 0		# Показатель голода: 0 - сыт, отрицательное - голоден, положительное - переедает 
		@sleep = 0		# Показатель сна: 0 - бодрый, отрицательное число - нужно спать
		@mood = 100		# Показатель настроения: 100 - отличное, меньше 100 - хуже
		@thirst = 0		# Показатель жажды: 0 - пить не нужно, отрицательное - необходимо пить 
		@health = 100		# Показатель здоровья: 100 - отличное, 0 - мертв
		@dirt = 0		# Показатель загрязненности: 0 - чисто, положительное число - нужно убрать. При достижении 48 начинает ухудшаться здоровье
		@birthday = Time.now	# Дата и время создания экземпляра
		@age = 0		# Возраст
		@weight = 0		# Показатель веса: 0 - в норме, больше 3-х страдает ожирением
		@count = 10 		# Счтечик жизненного цикла - 10 секунд компьютерного времени 1 час жизни виртуального питомца
		@wake = 0		# Если спит то тут когда пробудится от сна
		# Ниже указано на сколько меняются жизненные поазатели за 1 цикл (1 виртуальный час)
		@change_per_hour = {hunger: 1, sleep: 1, mood: 1, thirst: 1, dirt: 1, age: 1, weight: 1, health: 1}
	end 

	def help
		puts "Type \'eat\' to eat."
		puts "Type \'drink\' to drink."
		puts "Type \'play\' to play. You can improve parameters of mood and weight."
		puts "Type \'walk\' to walk. You can improve parameters of mood and weight."
		puts "Type \'treat\' to treat. You can improve parameter of health."
		puts "Type \'clean\' to clean."
		puts "Type \'caress\' to caress."
		puts "Type \'check\' to check status."
		puts "Type \'show_status\' to show parameters status."
	end

	def eat
		@hunger += 12					# питомец ест
		if @hunger > 0 and @weight > 3			# если показатель голода больше 0 (переедает) и показатель веса набрал критическое значение
			@weight += @change_per_hour[:weight]	# то питомец страдает ожирением. показатель веса увеличиваем дальше.
			puts @name + " is too fat!"		# сообщаем об этом
			return
		elsif @hunger < 0 and @weight <= 3		# если показатель голода меньше 0 (голодный) и показатель веса не набрал критическое значение
			@weight = 0				# то толстеть прекращаем, сбрасываем показатель веса
			return					
		elsif @hunger > 0				# если показатель голода больше 0 (передает), начинаем 
			@weight += @change_per_hour[:weight]	# увеличивать показатель веса
		end
	end
	
	def drink
		@thirst = 0					# питомец пьет. этот показатель не считаем критичным, кроме случая истощения от жажды
	end
	
	def play						# Играем с питомцем
		@mood += 8					# Показатель настроения увеличивается
		@hunger -= @change_per_hour[:hunger]		# Показатель голода меняется в сторону голода
		@thirst -= @change_per_hour[:thirst]		# Показатель жажды меняется в сорону жажды
		@sleep -= @change_per_hour[:sleep]		# Показатель сна тоже меняется, устает
		if @weight > 0 					# если был избыточные вес, то уменьшаем
			@weight -= @change_per_hour[:weight]	# показатель избыточного веса
		end
	end

	def walk						# Гуляем с питомцем
		@mood += 4					# Показатель настроения увеличиваем
		@hunger -= @change_per_hour[:hunger]		# Показатель голода меняем
		@thirst -= @change_per_hour[:thirst]		# Показатель жажды меням
		@sleep -= @change_per_hour[:sleep]		# Показатель сна меняем - устает
		if @weight > 0 					# Если был избыточный вес, то уменьшаем
			@weight -= @change_per_hour[:weight]	# показатель избыточного веса
		end
	end
	
	def treat						# Лечим
		@health = 100					# Считаем что курс лечения универсальный и восстанавливает показатель здоровья
		@wait = 0					# ну и веса тоже
	end
	
	def clean						# Чистим
		@dirt = 0					# Сбрасываем показатель чистоты
	end
	
	def caress						# Гладим
		@mood += @change_per_hour[:mood]		# При этом настроение улучшается
		@wake = @age + @change_per_hour[:sleep]		# ну и падает в сон на непродолжительное время
	end
	
	def check						# Проверяем состояние
		@attention = false				# Пока внимание не нужно
		change_life_status				# Изменяем жизненные показатели
		if @wake > 0 					# Проверям спит или нет
			puts @name + " is sleeping..."		# Если спит, сообщаем об этом дальше нет смысла проверять
			return					# выходим из метода
		end	
		if @hunger <= -12				# Голодный, давно не кормили 
			@attention = true			# пора привлечь внимание
		end
		if @hunger <= -96				# Критический показатель голода
			puts @name + " has died of hunger..."	# погиб от голода
			exit					# завершаем работу
		end
		if @sleep <= -12				# устал, пора спать
			puts @name + " is tired and it\'s falling to sleep..."	# сообщаем об этом
			@wake = @age + 6			# устанавливаем время когда проснуться (возраст + 6 циклов)
		end
		if @mood <= -12					# настроение ухудшилось
			@attention = true			# пора привлечь внимание
		end
		if @mood <= -96					# критический показатель настроения
			puts @name + " has died of boredom..."	# загинул от скуки
			exit					# завершаем работу
		end
		if @thirst <= -12				# мучает жажда
			@attention = true			# пора привлечь внимание
		end
		if @thirst <= -96				# критический показатель жажды
			puts @name + " has died of thirst..."	# засох
			exit					# завершаем работу
		end
		if @dirt >= 48					# критический показатель загрязнения
			@health -= @change_per_hour[:health]	# после этого начинает ухудшаться здоровье, необходимо лечение
			@attention = true			# пора привлечь внимание
		end
		if @health == 0					# критический показатель здоровья
			puts @name + " has died of health..."	# загнулся...
			exit					# завершаем работу
		end
		if @attention					
			puts "Meow-Meow!!!"			# привлекаем внимание хозяина, пусть думает что не так...
		end		
	end
	
	def show_status						# показать состояние показателей
		puts "huger : " + @hunger.to_s			# сделано для отладки
		puts "sleep : " + @sleep.to_s			# однако полезная штука
		puts "mood : " + @mood.to_s
		puts "thirst : " + @thirst.to_s
		puts "health : " + @health.to_s
		puts "dirt : " + @dirt.to_s
		puts @birthday
		puts "age : " + @age.to_s
		puts "weight : " + @weight.to_s
		puts @count
		puts "wake : " + @wake.to_s
	end
	
	private
	
	def change_life_status						# меняем жизненные параметры
		hour = (Time.now - @birthday).to_i / @count - @age	# вычисляем сколько циклов прошло после последнего обновления параметров
		@age += hour * @change_per_hour[:age]			# увеличиваем возраст на число циклов
		@hunger -= hour * @change_per_hour[:hunger]		# меняем показатель голода
		sleep(hour)						# вызываем метод для изменения показателя сна
		@mood -= hour * @change_per_hour[:mood]			# меняем показатель настроения
		@thirst -= hour * @change_per_hour[:thirst]		# меняем показатель жажды
		@dirt += hour * @change_per_hour[:dirt]			# меняем показатель грязи
		if @health < 100					# если со здоровьем проблемы,
			@health -= @change_per_hour[:health]		# то ухудшаем это состояние
		end
	end
	
	def sleep hour
		if @wake == 0 						# если не спит, то спать хочется больше
			@sleep -= hour * @change_per_hour[:sleep]	# меняем показатель сна
			return						# возвращаемся
		elsif (@wake - @age) > 0 				# если спит, то ест-но спать будет хотеться меньше
			@sleep += hour * @change_per_hour[:sleep] * 2	# меняем показатель сна/усталости
			return						# возвращаемся
		end
		# если проснулся в промежутке между обновлениями параметров, то сперва уменьшаем усталость на нужное кол-во циклов, 
		# а потом увеличиваем усталость на оставшееся колво циклов
		@sleep = @sleep + (hour - (@age - @wake)) * @change_per_hour[:sleep] * 2 - (@age - @wake) * @change_per_hour[:sleep]
		@wake = 0
	end
	
end

# Создаем экземпляр Pet
my_pet = Pet.new("Chupacabra")			# создаем новый экземпляр класса, называем его  
while true					# организовываем интерактивную обработку для вызова методов
	print "? "				
	action = gets.chomp			# получаем имя метода с клавиатуры
	if action == 'check'
		my_pet.check			# вызываем нужный метод
	elsif action == "show_status"
		my_pet.show_status
	elsif action == "eat"
		my_pet.eat
	elsif action == "drink"
		my_pet.drink
	elsif action == "walk"
		my_pet.walk
	elsif action == "treat"
		my_pet.treat
	elsif action == "clean"
		my_pet.clean
	elsif action == "caress"
		my_pet.caress
	elsif action == "play"
		my_pet.play
	elsif action == "help"
		my_pet.help
	end
end

