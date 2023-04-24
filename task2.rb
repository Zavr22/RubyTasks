#Сделать возможным safe_invert для Хэша (fruits_country = {
#'orange' => 'Marocco',
# 'banana' => 'Ecuador',
# 'lemon' => 'Marocco',
#})

def safe_invert(hash)
  inverted_hash = {}
  hash.each do |key, value|
    if inverted_hash.key?(value)
      inverted_hash[value] = [inverted_hash[value]] unless inverted_hash[value].is_a?(Array)
      inverted_hash[value] << key
    else
      inverted_hash[value] = key
    end
  end
  inverted_hash
end

# Пример использования
fruits_country = {
  'orange' => 'Marocco',
  'banana' => 'Ecuador',
  'lemon' => 'Marocco'
}

inverted_fruits_country = safe_invert(fruits_country)
puts "Inverted hash"
inverted_fruits_country.each do |key, value|
  if value.is_a?(Array)
    puts "#{key}: #{value.join(', ')}"
  else
    puts "#{key}: #{value}"
  end
end
