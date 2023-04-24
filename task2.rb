#Сделать возможным safe_invert для Хэша (fruits_country = {
#'orange' => 'Marocco',
# 'banana' => 'Ecuador',
# 'lemon' => 'Marocco',
#})

class Hash
  def safe_invert
    inverted_hash = {}
    each do |key, value|
      if inverted_hash[value].nil?
        inverted_hash[value] = [key]
      else
        inverted_hash[value] << key
      end
    end
    inverted_hash
  end
end

fruits_country = {
  'orange' => 'Marocco',
  'banana' => 'Ecuador',
  'lemon' => 'Marocco',
}

inverted_fruits_country = fruits_country.safe_invert
puts inverted_fruits_country

