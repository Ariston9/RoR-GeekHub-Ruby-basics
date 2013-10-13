aage = 1_000_000_000
sec_in_day = 60 * 60 *24   # секунд в дне
sec_in_year = sec_in_day * 365.2425  # секунд в году. Длительность года в григорианском календаре 365.2425 дней
year = age/sec_in_year.to_i  # к-во лет в 1 млн. сек.
ost = age-year*sec_in_year  # сколько секунд осталось за вычетом 31 года
ost_day = ost/sec_in_day  # узнаем сколько дней в остатке
month = (ost_day/(365.2425/12)).to_i  # сколько месяцев в остатке
day = (ost_day - month*365.24/12).to_i # сколько осталось дней за вычетом 8 месяцев
puts "Person whose age is #{age} seconds has lived #{year} years, #{month} monthes and #{day} days."
	

