require 'byebug'

def compare_all1(arr)
  arr.each do |el1|
    smallest_el = true
    arr.each do |el2|
      smallest_el = false if el2 < el1
    end
    return el1 if smallest_el
  end
end

def compare_all2(arr)
  smallest_el = arr.first
  arr.each do |el|
    smallest_el = el if el < smallest_el
  end
  smallest_el
end

def largest_contiguous_subsum1(list)
  subarrs = []
  list.each_with_index do |_, i|
    list[(i..-1)].each_with_index do |_, j|
      subarrs << list[i..i+j]
    end
  end
  subarrs
  largest_sum = 0
  subarrs.each do |subarr|
    sum = subarr.inject(:+)
    largest_sum = sum if largest_sum < sum
  end
  largest_sum
end

def largest_contiguous_subsum2(list)
  previous_sum = 0
  previous_largest_sum = 0
  list.each do |el|
    # if el > 0
    #   previous_sum += el
    if previous_sum + el > 0
      previous_sum += el
    else
      previous_sum = 0
    end
    if previous_sum > previous_largest_sum
      previous_largest_sum = previous_sum
    end
  end
  previous_largest_sum
end
