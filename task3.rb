def array_to_hash(array)
  result_hash = Hash.new(0)
  array.each { |element| result_hash[element] += 1 }
  result_hash
end

arr = [1, 2, 3, 1, 'ok', 3, 3, 'ok', 3, 'ok']
hash_with_count = array_to_hash(arr)
puts "hash with counted elements  : #{hash_with_count.to_s}"


