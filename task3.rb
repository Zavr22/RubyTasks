class Array
  def to_histogram
    result_hash = Hash.new(0)
    each { |element| result_hash[element] += 1 }
    result_hash
  end
end

arr = [1, 2, 3, 1, 'ok', 3, 3, 'ok', 3, 'ok']
hash_with_count = arr.to_histogram
puts hash_with_count


