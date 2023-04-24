# С клавиатуры вводится дата, единицы измерения(день, неделя, месяц, год) и длительность(целочисленное значение)
# - нужно вывести N последующих дат - использовать Хеш (ключ - ед.измерения, значения - Лямбда )
# Например
# вводится дата
# 9/18/2020
# единицы измерения(день, неделя, месяц, год)
# month
# и длительность(целочисленное значение)
# 10
#  - нужно вывести N последующих дат
# 4
# Должно вывести:
# 9/18/2020 10/18/2020 11/18/2020 12/18/2020
# Если единицы измерения дни, то получится
# 9/18/2020 9/28/2020 10/08/2020 10/18/2020


require 'date'

def calculate_next_dates(date, unit, duration, n)
  next_date_hash = {
    'day' => ->(date, duration) { date + duration },
    'week' => ->(date, duration) { date + (7 * duration) },
    'month' => ->(date, duration) { date.next_month + (duration*0)},
    'year' => ->(date, duration) { date + (duration* 365)}
  }
    if next_date_hash.key?(unit)
      next_date_hash = next_date_hash[unit]
      result = {}
      (1..n).each do |i|
        result[i] = date.strftime('%m/%d/%Y')
        date = next_date_hash.call(date, duration)
      end
      result
    else
      puts 'wrong unit'
    end
end

puts 'Enter data YYYY/MM/DD: '
date = Date.parse(gets.chomp)
puts 'Введите единицы измерения (day, week, month, year): '
unit = gets.chomp
puts 'Enter duration: '
duration = gets.chomp.to_i
puts 'Enter n'
n = gets.chomp.to_i

next_dates = calculate_next_dates(date, unit, duration, n)
if next_dates
  puts "Next #{n} dates: "
  next_dates.each { |key, value| puts "#{key}: #{value}" }
end
