require 'pry'

def append (ary, n)
    return 1 if n == 0
    append(ary, n - 1)
    ary.push(n)
    return ary
end

def factorial(n)
    return 1 if n == 1
    n * (factorial(n - 1))
end

def palindrome(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

def bottle(n)
    return puts "No more bottles" if n == 0 
    puts  "#{n} bottles of beer on the wall"
    bottle(n - 1)
end

def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

	
def flatten(array, result = [])
  array.each do |element|
    if element.kind_of?(Array)
      flatten(element, result)
    else
      result << element
    end
  end 
  result
end
  roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0
  roman_mapping.values.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping.key(divisor) * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

p integer_to_roman(roman_mapping, 9274)