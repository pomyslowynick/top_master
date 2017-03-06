class Hangman
    require 'io/console'
    require 'json'
    def Hangman.random_word
        word = File.readlines("5desk.txt")
        rand_word = word[rand(61407)]
        unless rand_word.length.between?(5, 12)
            rand_word = word[rand(61407)]
        end
        rand_word
    end
    @@user_input = []
    @@solution = Hangman.random_word.gsub!(/(\s)/, "")
    @@sol_array = @@solution.split("")
    @@sol_rep = []
    @@solution.length.times {@@sol_rep << "_"}
    @file_num = 1
    @@turn = 0
    def Hangman.save_game
        File.open("save#{@file_num}.json","w") do |f|
        f.write({"user_input" => @@user_input, "solution" => @@solution, "sol_array" => @@sol_array, "sol_rep" => @@sol_rep}.to_json)
        @file_num += 1
        end 
    end
    
    def get_answer
        while @@turn < 10 do
            puts "Type '1' to guess word, 2 to save, 3 to load:"
            answer = STDIN.getch.downcase
            unless @@sol_rep.include?("_") 
                puts "Gratz, you won"
                break
            end
            if answer == '1'
                puts "Write it boy:"
                answer = gets.chomp.downcase!
                answer == @@solution ? break : @@turn += 1
            elsif answer == '2'
                Hangman.save_game
                puts "Game saved"
                redo
            elsif answer == '3'
                
            elsif @@user_input.include?(answer) || @@sol_rep.include?(answer)
                puts "You already used that letter, try again"
                redo
            end
            @@sol_array.each_with_index {|z, y| z == answer && @@sol_rep[y] = z }
            unless ["1","2"].include?(answer) || @@sol_rep.include?(answer)
                @@user_input << answer
                @@turn += 1
            end
            p @@sol_rep
            puts "You have #{10 - @@turn} guesses left"
            puts "Wrong letters #{@@user_input}"
        end
        if @@turn == 10
            puts "Yikes, you lost, answer was '#{@@solution}'"
        end
    end
end

romb = Hangman.new
romb.get_answer



