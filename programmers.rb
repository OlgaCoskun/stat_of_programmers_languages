require 'json'

# Читаем содержимое файла stat.json
file = File.read("#{__dir__}/stat.json", encoding: 'UTF-8')

# Делаем ассоциативный массив из содержимого файла с помощью метода JSON.parse
# и записываем его в переменную programmers.
programmers = JSON.parse(file)

# Создадим инвертированный массив для удобства сортировки, в нем ключами будут
# числа — количество вакансий, а значениями — языки программирования.
programmers_inverted = programmers.invert

# Его легко сортировать по возрастанию (для этого в конце добавим reverse)
programmers_sorted = programmers_inverted.sort.reverse

# Теперь мы можем вывести самый популярный язык просто обратившись к первому
# элементу.
most_popular = programmers_sorted.first
puts "Самый популярный язык: #{most_popular.last} (#{most_popular.first}%)"
puts

# Выведем все языки в порядке убывания популярности
programmers_sorted.each_with_index do |language, index|
  puts "#{index + 1}: #{language.first}% (#{language.last})"
end