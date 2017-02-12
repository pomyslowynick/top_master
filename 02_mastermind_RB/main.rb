class MasterMind
   def initialize
       @arru = []
       @good_position = 0
       @exists_in_code = []
       @guess = 1
       @set_break = false
   end
   $solution = []
   
   def game_mode
      puts "Do you want to set code or break it?"
      puts "Type 1 for break mode, type 2 to set code."
      answer = gets.to_i
      if answer == 2
          @set_break = true
      end
   end
   
   def set_code
        if @set_break == false
            6.times do 
                $solution.push(rand(6) + 1)
            end
        else
            puts "Type 6 numbers that will make code"
            input_code = gets.chop.split("").map { |z| z.to_i }
            $solution = input_code
        end
   end

   def guess_comm
       puts "Put six numbers"
       iteration = 0
        6.times do
            @guess = gets.to_i
            @arru.push(@guess)
            @exists_in_code.push(@guess) if $solution.include?(@guess)
            @good_position +=1 if $solution[iteration] == @guess
            iteration += 1
        end
   end
  
   def appear_num
       count_in_code = @exists_in_code.uniq.size
       @exists_in_code.uniq.each do |z|
          counter_answer = @exists_in_code.select { |x| x == z }.size
          counter_code = $solution.select { |y| y == z }.size 
          count_in_code += counter_answer - 1 if 1 < counter_code && counter_answer <= counter_code
        end
        string_output = "You have #{count_in_code - @good_position} good guesses and #{@good_position} good guesses in good position"
        @exists_in_code = []
        @good_position = 0
        @arru = []
        return string_output
   end
   
   def check_solution_win
       correctness_iterator = 0
       @arru.each_with_index do |z,y|
           if z == $solution[y]
               correctness_iterator += 1
           else
               correctness_iterator = 0
               break
           end
       end
       if correctness_iterator == 6
            p "Grats buddy, you won!"
            return exit
       end
   end
   
   def solution
      $solution 
   end

end

player = MasterMind.new
player.game_mode
player.set_code
turns_var = 0
8.times do 
    turns_var += 1
    player.guess_comm
    player.check_solution_win
    puts player.appear_num
    puts "#{8 - turns_var} turns left"
end
puts "Correct solution is #{player.solution}"
