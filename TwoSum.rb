def two_sum(arr, sum)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      next if j <= i
      return true if el1 + el2 == sum
    end
  end
  false
end

#time complexity is n^2

def okay_two_sum?(arr, sum)
  arr = arr.sort
  arr.each_with_index do |el, idx|
    arr_dup = arr.dup
    arr_dup.delete_at(idx)
    return true if arr_dup.bsearch { |x| x == sum - el }
  end
  false
end

#time complexity is nlgn


def hash_two_sum(arr,sum)
  arr_hash = Hash.new(0)
  arr.each do |el|
    arr_hash[el] += 1
  end

  arr.each do |el|
    return true if arr_hash[sum - el] > 0 &&
                                  (sum - el != el || arr_hash[sum - el] > 1)
  end
  false
end

#time complexity is n (linear)

def hash_four_sum(arr, sum, n = 4)
  return hash_two_sum(arr, sum) if n == 2
  arr.each_with_index do |el,idx|
    arr_dup = arr.dup
    arr_dup.delete_at(idx)
    return true if hash_four_sum(arr_dup, (sum - el), n-1)
  end
  false
end

#time complexity is n
