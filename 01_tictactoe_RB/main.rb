welcome_message = "Welcome, I am more than pleased to invite you for a little Tic-Tac-Toe game."

puts welcome_message
ai_mode = false
puts "Type 1 for single player mode, type 2 for two players mode"
ai_gets = gets.chomp.to_i
while ai_mode == false
    if ai_gets == 1
        ai_mode = true
        puts "AI mode choosen"
    elsif ai_gets == 2
        puts "Two player mode choosen"
        break
    else
        puts "Type either 1 or 2"
        ai_gets = gets.chomp.to_i
        redo
    end
end

$MAP_RANGE = (1..9)
$MAP = $MAP_RANGE.to_a

win_status = false


puts "Game starts!\nChoose number from 1 to 9 to indicate what position you want to mark"
class Tic
    attr_reader :arr
    @@player_switch = 0
    def initialize
        @arr = []
    end
    
    def check_ai(ai)
        @@ai_mode = ai
    end
    def mark(pos)
        unless $MAP_RANGE.include?(pos)
            puts "Choose number from 1 to 9!"
            return 0
        end
        if $MAP.include? pos
            @arr.push(pos)
            $MAP.delete(pos)
            @@player_switch == 1 ? @@player_switch = 0: @@player_switch = 1
            if @@ai_mode == true
                if @@player_switch == 1
                    puts "You marked #{pos}."
                    gets
                else
                    puts "Your opponent marked #{pos}."
                end
            else
                puts "You marked #{pos}."
                puts "Press ENTER"
                gets
            end
        elsif $MAP == []
            puts "We have a draw!"
        else
            puts "Position already taken!"
            return 0
        end
        
    end
end

first_player_instance = Tic.new
second_player_instance = Tic.new
board = (1..9).to_a

    win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

while win_status == false
    first_player_instance.check_ai(ai_mode)
    if ai_mode == false

        loop do
            puts "Player X move:"
            player_move = gets.chomp.to_i
            redo if first_player_instance.mark(player_move) == 0
            board[player_move - 1] = "X"
            break
        end
        puts "[#{board[0]}\s\s#{board[1]}\s\s#{board[2]}]"
        puts "[#{board[3]}\s\s#{board[4]}\s\s#{board[5]}]"
        puts "[#{board[6]}\s\s#{board[7]}\s\s#{board[8]}]"
        loop do
            puts "Player O move:"
            player_move = gets.chomp.to_i
            redo if second_player_instance.mark(player_move) == 0
            board[player_move - 1] = "O"
            break
        end
        puts "[#{board[0]}\s\s#{board[1]}\s\s#{board[2]}]"
        puts "[#{board[3]}\s\s#{board[4]}\s\s#{board[5]}]"
        puts "[#{board[6]}\s\s#{board[7]}\s\s#{board[8]}]"
    end
    if ai_mode == true
        loop do
            puts "Player 1 move:"
            player_move = gets.chomp.to_i
            redo if first_player_instance.mark(player_move) == 0
            board[player_move - 1] = "X"
            break
        end
        ai_instance = Tic.new
        ai_move = $MAP.sample
        ai_instance.mark(ai_move) unless $MAP == []
    else
    end
    win.each do |z|
        if z&first_player_instance.arr == z
            puts "Grats Player 1, you won!"
            win_status = true
            break
        elsif z&second_player_instance.arr == z
            puts "Player 2 wins!"
            win_status = true
            break
        elsif ai_mode == true && z&ai_instance.arr == z
            puts "You LOST!"
            win_status = true
            break
        elsif $MAP == []
            win_status = true
            puts "We have a draw!"
            break
        end
    end
end