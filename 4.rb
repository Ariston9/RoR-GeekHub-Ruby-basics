#создаем массив
my_array = [621, 448, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 12, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 572, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 300]
# узнаем кол-во элементов
puts "elements count = " + my_array.count.to_s
# выводим перевернутый массив
puts "reverse array:"
# выведем элементы рядом а не каждый в новой строке
print my_array.reverse
puts
# наибольшее число
puts "Max_number = " + my_array.max.to_s
# наименьшее число
puts "Min_number = " + my_array.min.to_s
# среднее арифмитическое
sum = 0
my_array.each { |i| sum=sum+i }
puts "Arithmetical mean = #{ sum / my_array.count }"
# выводим отсортированный массив от меньшего к большему
puts "Sort array"
print my_array.sort
puts
# выводим отсортированный массив от большего к меньшему
puts "Reverse sort array"
print my_array.sort.reverse
puts
# удаляем все нечетные числа
# будем использовать метод delete_if этот метод меняет состояние массыва, поэтому создем копию
puts "Only Even elements"
array2 = Array.new(my_array)
print array2.delete_if { |i| i.odd? }
puts
# хотя чётные элементы можно вывести и следующим образом
puts "Only Even elements"
print my_array.select { |i| i.even? }
puts
# оставляем только те элементы, которые без остатка делятся на 3
puts "Divided 3"
array2 = Array.new(my_array)
print array2.delete_if { |i| i.divmod(3)[1]!=0 }
puts
# хотя опять же можно и так
puts "Divided 3"
print my_array.select { |i| i.divmod(3)[1]==0 }
puts
# выводим только уникальные числа (массив без повтооров)
puts "Unique elements"
print my_array.uniq
puts
# делим каждый элемент на 10 и выводим массыв чисел с плавающей запятой
puts "Divided 10"
print my_array.map { |i| i/10.to_f }
puts
# получаем новый массив, который содержал бы в себе буквы английского алфавита, порядковый номер которых есть в массиве (от 65 до 90 и от 97 до 122 включительно)
puts "Char array"
array2 = Array.new(my_array)
array2.delete_if { |i| (i < 65) or (i > 122) or ((i > 90) and (i < 97))}
print array2.map {|i| i.chr}
puts
# меняем местами минимальный и максимальный элементы массива используя параллельное присваивание
puts "Exchanged Max and Min elements"
array2 = Array.new(my_array)
a = array2.index(array2.max)
b = array2.index(array2.min)
array2[a],array2[b]=array2[b],array2[a]
print array2
puts
# выводим элементы, которые находятся перед минимальным числом в массиве
puts "All elements before Min element"
print my_array.slice(0,my_array.index(my_array.min))
puts
# выводим три наименьших элемента
puts "Three Min elements"
print my_array.sort.slice(0,3)
puts
