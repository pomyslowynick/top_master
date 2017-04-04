numbers = [1, 2, 3, 4]

numbers.each do |number|
  empty_arr = []
  empty_arr << number * 2 
  if numbers.length == empty_arr.length - 1
    numbers = empty_arr
  end
  p  empty_arr.length
end
puts numbers