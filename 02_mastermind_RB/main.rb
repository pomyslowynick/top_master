class MasterMind
   def initialize
       @arru = []
       @good_position = 0
       @exists_in_code = []
       @guess = 1
   end
   @@turns = 1
   $solution = []
   
   def set_code
        6.times do 
            $solution.push(rand(6) + 1)
        end
   end

   def guess_comm
       puts "Put six numbers"
       iteration = 0
        6.times do
            @guess = gets.to_i
            @exists_in_code.push(@guess) if $solution.include?(@guess)
            @good_position +=1 if $solution[iteration] == @guess
            iteration += 1
            @@turns += 1
        end
        @@turns += 1
   end
  
   def appear_num
       count_in_code = @exists_in_code.uniq.size
       @exists_in_code.uniq.each do |z|
          counter_code = $solution.select { |y| y == z }.size 
          count_in_code += counter_code - 1 if 1 < counter_code
        end
        string_output = "You #{count_in_code - @good_position} good guesses and #{@good_position} good guesses in good position"
        @exists_in_code = []
        @good_position = 0
        return string_output
   end
   
   def solution
      p $solution 
   end

end

player = MasterMind.new
player.set_code
8.times do 
    player.guess_comm
    puts player.appear_num
end
puts "Correct solution is #{player.solution}"
